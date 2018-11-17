#!/usr/bin/env bash

DIST=/tmp/training-vm-preinstall-diffs
mkdir -p "$DIST"

apt-mark showmanual > "$DIST"/aptmark_showmanual.orig.txt
sudo -H pip freeze | sort > "$DIST"/pipfreeze.orig.txt

/opt/devstack/stack.sh

apt-mark showmanual | sort > "$DIST"/aptmark_showmanual.after.txt
sudo -H pip freeze > "$DIST"/pipfreeze.after.txt

# Generate packages.yaml
comm -13 "$DIST"/aptmark_showmanual.{orig,after}.txt | sed 's/$/:/' > "$DIST"/packages.yaml

# Generate requirements.txt
comm -13 "$DIST"/pipfreeze.{orig,after}.txt \
    | grep -v 'git+http' \
    > "$DIST"/requirements.txt

# Generate openstack_git_repos.txt
pushd /opt/stack
find . -mindepth 1 -maxdepth 1 -type d | while read -r repo; do
    pushd "$repo"
    git remote show origin -n \
        | awk '/Fetch URL/{ print $3 }' \
        >> "$DIST"/openstack_git_repos.txt
    popd
done
popd
