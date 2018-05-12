#!/usr/bin/python2.7

import sys, re, time

def checkForIgnore(line, namelist):
    name = line.split(' ')
    for regex in namelist:
        if re.search(regex, name[0]):
            sys.stdout.write("playerlist\n")
            sys.stdout.flush()

def doIgnore(line, namelist, slots):
    name = line[line.find(r"[")+1:line.rfind(r"]")]
    slot = line[:line.find(':')].lstrip()
    for regex in namelist:
        if re.search(regex, name):
            if not slots[int(slot)]:
                time.sleep(1)
                sys.stdout.write("ignore %d\n" % int(slot))
                sys.stdout.flush()
                slots[int(slot)] = True
    return slots

if __name__ == "__main__":
    playerlist = False
    slots = dict()
    for i in range(32):
        slots[i] = False
    namelist = [r"^aimhigh$", \
        r"^ROY_MOORE$", \
        r"^jupiter$", \
        r"^Dickus$", \
        r"^ni<3$", \
        r"^dirty", \
        r"^Little"]
    
    while True:
        s = sys.stdin.readline()
        if not s:
            sys.exit(0)
        if playerlist:
            if re.search(r"^End current player list.$", s):
                playerlist = False
                continue
            elif re.search(r"^  [0-9]+: \[.*\]$", s):
                slots = doIgnore(s, namelist, slots)
                continue
            else:
                playerlist = False
        if re.search(r"^[^ ]+ connected$", s):
            checkForIgnore(s, namelist)
        elif re.search(r"^Current players:$", s):
            playerlist = True
        elif re.search(r"^CL_InitCGame:", s):
            for slot in slots:
                slots[slot] = False
            time.sleep(5)
            sys.stdout.write("playerlist\n")
            sys.stdout.flush()
