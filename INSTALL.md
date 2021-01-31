# Step-by-step installation

On a fresh installation, take the following steps to end up with my configurations:

1. Update apt and install git.
```bash
sudo apt-get update
sudo apt install git
```
2. Run the executable in this repository (termite goes wrong so you need to install it again
   (and the it suddenly works))
```bash
git clone https://github.com/jorisperrenet/iscripts.git && cd iscripts
sh install.sh
sh manual_install/termite.sh
```
4. Reboot and boot into `i3`.
5. Don't be surprised when the screen is totally purple (this is because of compton). This can
   happen because of the command `compton -b` instead of `compton`. This is something that can
   happen but I need to check if it really does it all the time. Hit `Mod+Shift+r` (with `Mod` being `Alt` in this setup) to reload the config file and restart `i3` inplace.
6. Install the manual programs in `manual-progs.csv`. It might be useful to open the file in the
   terminal and use `Control click` to open the URLs in the browser.
7. Follow the steps in my [dotfiles repo](https://github.com/jorisperrenet/dotfiles) to complete
   the installation for certain programs using plugin managers.
8. Generate ssh-keys to set up on GitHub, GitLab and what not.
```bash
ssh-keygen -t rsa -b 2048 -C "email@example.com"
```
