#!/bin/sh

git clone https://gitlab.com/op_so/ansible/os-update.git xyz

cd xyz || exit
git config user.email "soubirou@yahoo.fr"
git config user.name "jfx"
git remote add github "https://${1}@github.com/jfx/ansible-os-update.git"

git push github --tags
git push github main
