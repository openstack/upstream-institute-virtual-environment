#!/usr/bin/env bash

apt-mark showmanual > aptmark_showmanual.orig.txt
sudo -H pip freeze > pipfreeze.orig.txt

/opt/devstack/stack.sh


apt-mark showmanual > aptmark_showmanual.after.txt
sudo -H pip freeze > pipfreeze.after.txt

# Generate packages.yaml
comm -13 aptmark_showmanual.{orig,after}.txt | sed 's/$/:/' > packages.yaml

# Generate requirements.txt
comm -13 pipfreeze.{orig,after}.txt \
    | grep -v 'git+http' \
    > requirements.txt

# Generate openstack_git_repos.txt
pushd /opt/stack
find . -mindepth 1 -maxdepth 1 -type d | while read -r repo; do
    pushd "$repo"
    git remote show origin -n \
        | awk '/Fetch URL/{ print $3 }' \
        >> ../openstack_git_repos.txt
    popd
done
popd
