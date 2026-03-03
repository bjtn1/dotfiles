#!/bin/bash
# Sets Cmd+Shift+S as the "Save picture of selected area as a file" shortcut.
# (macOS default is Cmd+Shift+4, key 30 in com.apple.symbolichotkeys)
#
# Modifiers: Cmd (1048576) + Shift (131072) = 1179648
# Key:       's' — ASCII 115, virtual keycode 1

python3 - << 'EOF'
import plistlib, os

path = os.path.expanduser('~/Library/Preferences/com.apple.symbolichotkeys.plist')

with open(path, 'rb') as f:
    plist = plistlib.load(f)

plist['AppleSymbolicHotKeys']['30'] = {
    'enabled': True,
    'value': {
        'parameters': [115, 1, 1179648],
        'type': 'standard'
    }
}

with open(path, 'wb') as f:
    plistlib.dump(plist, f)
EOF

/System/Library/PrivateFrameworks/SystemAdministration.framework/Resources/activateSettings -u
echo "Screenshot shortcut set to Cmd+Shift+S"
