#! /bin/zsh

cd ~/NixOS-Config

sudo cp /etc/nixos/configuration.nix ~/.nixConfig/configuration.nix

git add -v ~/.nixConfig/*

echo -n "Commit message: "
read -r commitMessage

git commit -m "$commitMessage" 

git push --set-upstream origin main
