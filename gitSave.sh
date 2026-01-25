#! /bin/bash

cd ~/NixOS-Config

sudo cp /etc/nixos/configuration.nix ~/NixOS-Config/configuration.nix

git add -v ~/NixOS-Config/*

echo -n "Commit message: "
read -r commitMessage

git commit -m "$commitMessage" 

git push --set-upstream origin main
