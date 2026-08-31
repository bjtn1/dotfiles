function bat --description 'bat, falling back to batcat (Debian/Ubuntu package renames the binary)'
  if command -q bat
    command bat $argv
  else if command -q batcat
    command batcat $argv
  else
    echo "bat: command not found (install 'bat', or 'batcat' on Debian/Ubuntu)" >&2
    return 127
  end
end
