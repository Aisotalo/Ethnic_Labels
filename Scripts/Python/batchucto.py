#!/usr/bin/python3

import sys, os

with open("ids_aa.dat", "r") as txt:
	lines = txt.readlines()
for line in lines:
	line = line.strip()
	print(line)
	os.system("ucto -v -L en "  + line + " output_" + line)

