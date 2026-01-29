#! /bin/zsh

cd ~/.nixconfig

git add -v ~/.nixconfig/*

echo -n "Commit message: "
read -r commitMessage

git commit -m "$commitMessage" 

git push --set-upstream origin main
