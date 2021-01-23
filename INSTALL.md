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
3. Reboot and boot into `i3`.
4. Install the manual programs in `manual-progs.csv`. It might be useful to open the file in the
   terminal and use `Control click` to open the URLs in the browser.
5. Follow the steps in my [dotfiles repo](https://github.com/jorisperrenet/dotfiles) to complete
   the installation for certain programs using plugin managers.
6. Generate ssh-keys to set up on GitHub, GitLab and what not.
```bash
ssh-keygen -t rsa -b 2048 -C "email@example.com"
```
