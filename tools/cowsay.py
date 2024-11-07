#!/usr/bin/env python3
import os
import sys
import random
cowsay_path = os.path.realpath(sys.argv[0])
cow_dir = os.path.dirname(cowsay_path) + '/cows'
if len(sys.argv) == 1:
    x = ''
else:
    x = sys.argv[1]
cows = os.listdir(cow_dir)
ncows = len(cows)
cow = cows[random.randint(0, ncows-1)]
cow = open(cow_dir + '/' + cow).readlines()
xl = len(x)
if xl != 0:
    print('-' * (xl + 4))
    print('< ' + x + ' >')
    print('-' * (xl + 4))
for c in cow:
    print(c[:-1])
