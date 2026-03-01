#! /bin/zsh

git add -v ./../*
git add -v ./../.gitignore

echo -n "Commit message: "
read -r commitMessage

git commit -m "$commitMessage"

git pull --rebase

git push --set-upstream origin untested
