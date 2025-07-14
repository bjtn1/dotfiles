#!/usr/bin/env bash

set -euo pipefail

function v
    set file (fzf --preview='bat --color=always --style=numbers {}')
    if test -f "$file"
        nvim $file
    end
end
