#!/usr/bin/python

import sys
import pynmea2

while 1:
    try:
        line = sys.stdin.readline()
    except KeyboardInterrupt:
        break

    if not line:
        break

    msg = pynmea2.parse(line)

print msg.latitude
print msg.longitude

