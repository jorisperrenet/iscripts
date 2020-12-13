#!/bin/sh

### OPTIONS AND VARIABLES ###

printhelp() {
# `cat << EOF` means that cat should stop reading when EOF is detected.
cat << EOF
Optional arguments for custom use:

-h      Display this message.
-p      Dependencies and programs csv (local file or url).

EOF

# Exit once we have printed the help message.
exit 1
}

while getopts ":h" opt; do
    case $opt in
        h) printhelp ;;
        p) progsfile=${OPTARG} ;;
    esac
done

[ -z "$progsfile" ] && progsfile="https://raw.githubusercontent.com/yannickperrenet/iscripts/master/progs.csv"
[ -z "$dotfilesrepo" ] && dotfilesrepo="https://github.com/yannickperrenet/dotfiles.git"

### FUNCTIONS ###

installpkg() {
    sudo apt install -y $1 > /dev/null 2>&1
}

maininstall() {
    echo "Installing \`$1\` ($n of $total). $1 $2"
    installpkg "$1"
}

pipinstall() {
    echo "Installing the Python package \`$1\` ($n of $total). $1 $2"

    # Install pip3 if it is not yet installed.
    [ -x "$(command -v "pip3")" ] || installpkg python3-pip > /dev/null 2>&1

    # Install the Python package without prompting the user for
    # confirmation.
    yes | pip3 install "$1"
}

progsinstallation() {
    # Delete the header of the csv file.
    [ -f "$progsfile" ] && cat "$progsfile" | sed '/^#/d' > /tmp/progs.csv

    total=$(wc -l < /tmp/progs.csv)

    # Use , as the delimeter.
    while IFS=, read -r tag program comment; do
        # Indication of how many programs we have installed so far.
        n=$((n+1))

        # Remove the "" from the comment.
        comment="$(echo "$comment" | sed "s/\(^\"\|\"$\)//g")"

        case "$tag" in
            "P") pipinstall "$program" "$comment" ;;
            *) maininstall "$program" "$comment" ;;
        esac
    done < /tmp/progs.csv
}

putgitrepo() { # Downloads a gitrepo $1 and places the files in $2 only overwriting conflicts
    echo "Installing dotfiles..."

    # Create a temporary directory and the destination directory, and
    # make sure they are owned by the current user.
	dir=$(mktemp -d)
    [ ! -d "$2" ] && mkdir -p "$2"
    chown -R "$USER":"$USER" "$dir" "$2"

	sudo -u "$USER" git clone --recursive "$1" "$dir" > /dev/null 2>&1
	sudo -u "$USER" cp -rfT "$dir" "$2"
}

### THE ACTUAL SCRIPT ###

# Build dependencies.
for x in curl git zsh; do
	echo "Installing \`$x\` which is required to install and configure other programs."
	installpkg "$x"
done

# Install the programs from the progsfile.
progsinstallation

# Install the dotfiles in the user's home directory.
putgitrepo "$dotfilesrepo" "/home/$USER/.config"

# Make zsh the default shell for the user.
chsh -s /bin/zsh "$name" > /dev/null 2>&1
sudo -u "$name" mkdir -p "/home/$name/.cache/zsh/"
