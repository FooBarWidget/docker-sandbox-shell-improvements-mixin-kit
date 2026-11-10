#!/usr/bin/env bash

__git_branch() {
    local branch
    branch=$(git symbolic-ref --quiet --short HEAD 2>/dev/null) ||
        branch=$(git rev-parse --short HEAD 2>/dev/null) ||
        return
    printf ' (%s)' "$branch"
}

__install_git_prompt() {
    local prompt
    local prompt_prefix
    local prompt_marker

    prompt='$(__git_branch)'

    if [[ $PS1 != *"$prompt"* ]]; then
        if [[ $PS1 =~ ^(.*)(\$)(([[:space:]]|\\\[[^]]*\\\])*)$ ]]; then
            prompt_prefix=${BASH_REMATCH[1]}
            prompt_marker=${BASH_REMATCH[2]}
            if [[ $prompt_prefix == *\\ ]]; then
                prompt_prefix=${prompt_prefix%?}
                prompt_marker="\\$prompt_marker"
            fi
            PS1="${prompt_prefix}${prompt}${prompt_marker}${BASH_REMATCH[3]}"
        elif [[ $PS1 == *__GIT_BRANCH__* ]]; then
            PS1=${PS1//__GIT_BRANCH__/$prompt}
        else
            PS1="${PS1}${prompt}"
        fi
    fi
}
