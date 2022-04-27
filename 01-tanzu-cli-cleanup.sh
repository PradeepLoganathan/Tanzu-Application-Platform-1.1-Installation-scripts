sudo rm /usr/local/bin/tanzu
## Remove config directories
rm -rf ~/.config/tanzu/   # current location
rm -rf ~/.tanzu/          # old location
## Remove plugins on macOS
rm -rf ~/Library/Application\ Support/tanzu-cli/*
## Remove plugins on Linux
rm -rf ~/.local/share/tanzu-cli/*