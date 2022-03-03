#!/bin/bash

do_git_tag ()
{
    # Get highest tag number, and add 1.0.0 if doesn't exist.
    CURRENT_TAG=`git describe --abbrev=0 --tags 2>/dev/null`

    if [[ $CURRENT_TAG == '' ]]; then
        CURRENT_TAG='v0.0.0'
    fi

    echo "Current Tag: $CURRENT_TAG"

    # Verify correct format for current version.
    if [[ ! $CURRENT_TAG =~ ^[vV]?[0-9]\.[0-9]\.[0-9]$ ]]; then
        echo "Current Tag format is not supported. Should be 'v{int}.{int}.{int}' (or without 'v', or with capital 'V')"
        exit 1
    fi

    CURRENT_VERSION="$CURRENT_TAG"
    CURRENT_VERSION_PREFIX=""

    if [[ $CURRENT_TAG =~ ^[vV][0-9\.]+$ ]]; then
        CURRENT_VERSION_PREFIX=$(echo "$CURRENT_TAG" | sed -E 's/^([vV])[0-9\.]+$/\1/g')
        CURRENT_VERSION=$(echo "$CURRENT_TAG" | sed -E 's/^[vV]([0-9\.]+)$/\1/g')
    fi

    echo "Current Version: $CURRENT_VERSION"

    # Replace . with space so can split into an array.
    CURRENT_VERSION_PARTS=(${CURRENT_VERSION//./ })

    # Get number parts
    VNUM1=${CURRENT_VERSION_PARTS[0]}
    VNUM2=${CURRENT_VERSION_PARTS[1]}
    VNUM3=${CURRENT_VERSION_PARTS[2]}

    if [ $VERSION == 'major' ]; then
        VNUM1=$((VNUM1+1))
        VNUM2="0"
    VNUM3="0"
    elif [[ $VERSION == 'minor' ]]; then
        VNUM2=$((VNUM2+1))
        VNUM3="0"
    elif [[ $VERSION == 'patch' ]]; then
        VNUM3=$((VNUM3+1))
    else
        echo "No version type (https://semver.org/) or incorrect type specified, try: -v [major, minor, patch]"
        exit 1
    fi

    # Define new tag.
    NEW_TAG="$CURRENT_VERSION_PREFIX$VNUM1.$VNUM2.$VNUM3"
    echo "Updating $CURRENT_TAG to $NEW_TAG ($VERSION)"

    # Get current hash and see if it already has a tag.
    GIT_COMMIT=`git rev-parse HEAD`
    NEEDS_TAG=`git describe --contains $GIT_COMMIT 2>/dev/null`

    # Only tag if commit doesn't already have one.
    if [ -z "$NEEDS_TAG" ]; then
        echo "Creating tag $NEW_TAG ..."
        git tag -a $NEW_TAG -m "Version $NEW_TAG"
        echo "Tag $NEW_TAG created."
        git push origin "$NEW_TAG"
        echo "Tag $NEW_TAG pushed to origin."
    else
        echo "This commit already has a tag. No new tag created."
    fi
}