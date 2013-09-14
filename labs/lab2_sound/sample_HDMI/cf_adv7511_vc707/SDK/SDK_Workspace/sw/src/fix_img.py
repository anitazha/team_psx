#!/usr/bin/python

import ctypes

fh = open("cf_hdmi_demo.h.org", "rt");
nfh = open("cf_hdmi_demo.h", "wt");
f = fh.readlines();
fh.close();

res = "";
for l in f:
    if (len(l) >= 1 and l[0] == "\t"):
        i = int(l.strip()[:-1], 16);
        h = ctypes.c_uint32(~i).value;
        l = "\t\t" + ("0x%08X" % h) + ",\n";
    res += l;

nfh.write(res);
nfh.close();
