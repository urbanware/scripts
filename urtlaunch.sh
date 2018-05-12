#!/bin/sh

# Change these variables
PARSELOG=${PARSELOG:-$HOME/bin/urtparse.log}
PARSESCRIPT=${PARSESCRIPT:-$HOME/bin/urtparse.py}
URTPATH=${URTPATH:-"/home/zig/Games/UrbanTerror43/Quake3-UrT.x86_64"}
# Add any other arguments to UrT here, before +set ttycon 1
URTARGS=${URTARGS:-"+set ttycon 1"}

# System variables (change only if non-standard)
TAILPATH=${TAILPATH:-/usr/bin/tail}
TEEPATH=${TEEPATH:-/usr/bin/tee}

# Don't touch below

rm -f "$PARSELOG"
touch "$PARSELOG"
"$TAILPATH" -n0 -f -s 0.01 "$PARSELOG" | "$PARSESCRIPT" | ${URTPATH} ${URTARGS} 2>&1 | "$TEEPATH" -a "$PARSELOG"