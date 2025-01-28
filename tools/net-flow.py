#!/usr/bin/env python3

import time
import os


K = 1024
M = K * 1024
G = M * 1024

fmt1 = "%-15s%15s%15s"
fmt2 = "%-15s%10.2f%5s%10.2f%5s"
sep_str = "-"*(15+15+15)

while True:
    info1 = open('/proc/net/dev').readlines()
    #print(info1[2])
    time.sleep(1)
    info2 = open('/proc/net/dev').readlines()
    #print(info2[2])

    os.system('clear')
    print(sep_str)
    print(fmt1%("Network Card", "Receive", "Transmit"))
    print(sep_str)
    for i in range(2, len(info1)):

        l1 = info1[i]
        l1 = l1.split()
        l2 = info2[i]
        l2 = l2.split()

        if (l1[0] != l2[0]):
            print("Error1")
            exit()
        net_name = l1[0]
        net_speed = [ int(l2[1]) - int(l1[1]), int(l2[9]) - int(l1[9]) ]
        u = [ 'b/s', 'b/s' ]

        for j in range(2):

            if net_speed[j] > G:
                net_speed[j] = net_speed[j] / float(G)
                u[j] = 'Gb/s'
                continue

            if net_speed[j] > M:
                net_speed[j] = net_speed[j] / float(M)
                u[j] = 'Mb/s'
                continue

            if net_speed[j] > K:
                net_speed[j] = net_speed[j] / float(K)
                u[j] = 'Kb/s'
                continue
        #print(net_name, net_speed)

        print(fmt2%(net_name[:-1], net_speed[0], u[0], net_speed[1], u[1]))
    print(sep_str)

