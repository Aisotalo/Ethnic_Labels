#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys, os, os.path, glob, codecs

# Fix output for Windows and Komodo Edit
sys.stdout = codecs.getwriter('utf-8')(sys.stdout.detach())


delimiterSet = ";.,!?\"()':[]\n/+-—=≤≥{}><*’”“|"
digits = "0123456789"
chars = "abcdefghijklmnopqrstuvwxyz"
chars = "".join( (chars, chars.upper()) )
spaces = " \t\n"
numberdelimiters = ",."


def main(fname):
   global delimiterSet

   if not os.path.isfile(fname):
      print("Error: Not a file", fname, "\n")
      usage()
      return

   try:
      inStream = open(fname, mode="r", encoding="utf-8")
      token = ""
      ch = inStream.read(1)
      lookahead = inStream.read(1)
      while True:
         if not ch:
            if token:
               print(token, file=sys.stdout)
            break
         if ch in delimiterSet:
            if token:
               if token[-1] in digits and lookahead in digits and ch in numberdelimiters:
                  token = "".join( (token, ch) )
               elif token[-1] in chars and lookahead in chars and ch in numberdelimiters:
                  token = "".join( (token, ch) )
               else:
                  print(token, file=sys.stdout)
                  token = ""
                  if ch not in spaces:
                     print(ch, file=sys.stdout)
         elif ch in spaces:
            if token:
               print(token, file=sys.stdout)
               token = ""
         else:
            token = "".join( (token, ch) )
         ch = lookahead
         lookahead = inStream.read(1)
      inStream.close()
   except IOError:
      print("Cannot read from file:", fname, file=sys.stdout)


def usage():
   print("""
tokenizer.py

Usage:
python3 tokenizer.py mytext.txt myothertext.txt ...
""")


if __name__ == '__main__':
   if len(sys.argv) > 1:
      for i in sys.argv[1:]:
         for j in glob.glob(i):
            main(os.path.expanduser(os.path.expandvars(j)))
   else:
      usage()


