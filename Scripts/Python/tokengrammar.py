#!/usr/bin/python3

import sys, os

with open("ids.dat", "r") as txt:
	lines = txt.readlines()
for line in lines:
	line = line.strip()
	print(line)
	os.system("./tokenizer.py -t -i -n 1 " + line)

