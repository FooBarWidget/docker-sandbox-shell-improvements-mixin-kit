#!/usr/bin/env bash

__install_pwd_basename_prompt() {
    PS1=${PS1//\\w/\\W}
}
