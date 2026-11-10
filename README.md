Many [official Docker Sandbox base kits (v3)](https://docs.docker.com/ai/sandboxes/customize/use-kits/#published-v3-workloads) have a pretty bad shell environment. This repository contains a mixin that improves quality of life. Tested against [docker/sbx-kit-opencode](https://hub.docker.com/r/docker/sbx-kit-claude) and [docker/sbx-kit-claude](https://hub.docker.com/r/docker/sbx-kit-claude), but should work with any base kits that's based on their Debian Docker Hardened Images.

## Improvements

- Bash prompt:
  - Line wrapping was broken, because the prompt contains a UTF-8 character. This mixin fixes the locale settings so that Bash properly handles UTF-8 characters in prompts.
  - Shows the active Git branch.
  - Allows showing the basename of the working directory instead of the entire working directory. Opt-in by setting the kit arg `bash_prompt_pwd_basename: "true"`.
- Nano:
  - Set as default editor
  - Word wrapping
  - Tab size 4 instead of 8
  - Navigation and editing: auto indenting, line numbers, smart home key
  - Interface: scroll bar, minibar with column position
  - Convenience: persisting search and file position history
- `ls` shows colors and displays humanized file sizes (2K, 55M, 2G) instead of bytes.

## Usage

In your `sbxenv.yaml`:

```yaml
kits:
  - source: git+https://github.com/FooBarWidget/docker-sandbox-shell-improvements-mixin-kit.git
    args:
      bash_prompt_pwd_basename: "true" # default: "false"
```
