#!/usr/bin/env python
import argparse
import matplotlib.pyplot as plt
import numpy as np

def get_args():
    parser= argparse.ArgumentParser(description="Parses sam file")
    parser.add_argument("-f", help= "filename")
    parser.add_argument("-o", help="output file name")
    return parser.parse_args()

args = get_args()

with open(args.f) as fh:
    r1 = {}
    r2 = {}
    for line in fh:
        line = line.strip()
        origin = line.split(' ')[1]
        length = int(line.split(' ')[2])
        if length == 0:
            continue

        if origin.startswith( '1' ):
            if length not in r1:
                r1[length] = 1
            else:
                r1[length] += 1
        elif origin.startswith('2'):
            if length not in r2:
                r2[length] = 1
            else:
                r2[length] += 1


# ax = plt.subplot(111)

X1 = []
X2 = []
for i in r1:
    X1.append(float(i))
for i in r2:
    X2.append(float(i))

X1 = np.array(X1)

plt.bar(X1, r1.values(), color='g')
plt.bar(X1 + 0.2, r2.values(), color='b')

plt.legend(('Read 1 Lengths','Read 2 Lengths'))
plt.title("Read 1 and Read 2 Lengths", fontsize=17)
plt.ylabel("Length frequency (log scale)")
plt.xlabel("Read Length")
plt.yscale('log')
plt.savefig(f'{args.f}_plotp2.png')
