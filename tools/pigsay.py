#!/usr/bin/env python3
import os
import sys
import random
pigsay_path = os.path.realpath(sys.argv[0])
pig_dir = os.path.dirname(pigsay_path) + '/pigs'
if len(sys.argv) == 1:
    x = ''
else:
    x = sys.argv[1]
pigs = os.listdir(pig_dir)
npigs = len(pigs)
pig = pigs[random.randint(0, npigs-1)]
pig = open(pig_dir + '/' + pig).readlines()
xl = len(x)
if xl != 0:
    print('-' * (xl + 4))
    print('< ' + x + ' >')
    print('-' * (xl + 4))
for c in pig:
    print(c[:-1])
