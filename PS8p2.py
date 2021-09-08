#!/usr/bin/env python
import argparse

def get_args():
    parser= argparse.ArgumentParser(description="Parses sam file")
    parser.add_argument("-f", help= "filename")
    return parser.parse_args()

args = get_args()

with open(args.f) as fh:
    
    mapped = 0
    unmapped = 0
    
    for line in fh:
        line = line.strip()
        #getting rid of the header lines in sam file.
        if line.startswith('@'):
            continue
        #capturing bitwise flag in variable
        flag = line.split("\t")[1]

        #if secondary alignment condition is met, continue to next loop
        if((int(flag) & 256) == 256):
            continue
        else:
            if ((int(flag) & 4) != 4):
                mapped+=1
            else:
                unmapped+=1

print(mapped, unmapped)