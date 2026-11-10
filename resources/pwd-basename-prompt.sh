#!/usr/bin/env bash

__install_pwd_basename_prompt() {
    if [[ "$BASH_PROMPT_PWD_BASENAME" == 1 ]]; then
        PS1=${PS1//\\w/\\W}
    fi
}
