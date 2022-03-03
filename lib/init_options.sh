#!/bin/bash

# ----------------------------------------------------------
# Options.
# ----------------------------------------------------------

HELP=false
SCRIPT_REPO="git@github.com:thomasisberg/git-tag.git"
SELF_UPDATE=false
VERSION="patch"

# Get options.
while test $# != 0
do
    case "$1" in
    -h)                 HELP=true ;;
    --help)             HELP=true ;;
    --major)            VERSION="major" ;;
    --minor)            VERSION="minor" ;;
    --patch)            VERSION="patch" ;;
    --script-repo=*)    SCRIPT_REPO="${1#*=}" ;;
    --self-update)      SELF_UPDATE=true ;;
    esac
    shift
done
