#!/bin/bash

# ----------------------------------------------------------
# Automatically creates a next version Git tag.
#
# Run git-tag to create a new tag with increased version
# number (major, minor or patch) and push the tag to origin.
# Defaults to increased patch number.
# ----------------------------------------------------------

# ----------------------------------------------------------
# Creator: Thomas Isberg
# ----------------------------------------------------------


# Resolve project path and config folder.
PWD=$(pwd)
PWD_DIRNAME=${PWD##*/}

# Resolve script folder.
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
if [ -L ${BASH_SOURCE[0]} ]; then
    DIR="$(dirname "$(readlink "$0")")"
fi

# Verify correct format for current version.
if [[ ! $CURRENT_TAG =~ ^[vV]?[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
  echo "Current Tag format ($CURRENT_TAG) is not supported. Should be 'v{int}.{int}.{int}' (or without 'v', or with capital 'V')"
  exit 1

# Import bash files.
for f in $DIR/lib/*.sh; do
    source $f
done


# Print help.
if $HELP; then
    print_help
    exit
fi


DRY_RUN=false


# Self update
if $SELF_UPDATE; then
    do_self_update
    exit
fi


# Update Git tag.
do_git_tag


exit 0