#!/bin/bash

# ----------------------------------------------------------
# Print help
# ----------------------------------------------------------

print_help ()
{
    echo ""
    echo -e "${C_1}Automatically creates a next version Git tag.${C_0}"
    echo -e ""
    echo -e "${C_1}Run ${C_CYAN}git-tag${C_1} to create a new tag with increased version number (major, minor or patch) and push the tag to origin. Defaults to increased patch number."
    echo ""
    echo -e "${C_1}Options:${C_0}"
    echo -e "${C_INFO}-h, --help            ${C_EM}Display this help${C_0}"
    echo -e "${C_INFO}--major               ${C_EM}Increase major number${C_0}"
    echo -e "${C_INFO}--minor               ${C_EM}Increase minor number${C_0}"
    echo -e "${C_INFO}--patch               ${C_EM}Increase patch number${C_0}"
    echo -e "${C_INFO}--script-repo=        ${C_EM}Used in combination with ${C_CYAN}--self-update${C_EM}. Sets URI to repository if you want to override the default one.${C_0}"
    echo -e "${C_INFO}--self-update         ${C_EM}Update git-tag to latest version. Takes no other options than ${C_CYAN}--script-repo${C_EM}.${C_0}"
    echo ""
}
