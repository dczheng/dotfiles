#!/usr/bin/env python3
import os
import sys
import argparse
import time

def job_info(sl):

    print( '-'*sl )
    print( '^_^ job information ^_^' )
    print( '-'*sl )

    job_info = os.popen( 'ps aHux' )
    users = os.popen( 'ls /home' ).readlines()
    #print( users )

    R_jobs = []
    R_users = []
    Remove_pro = [ 'ps', 'top', 'tmux', 'grep', 'htop', 'sshd:' ]

    for i in job_info:
        t = i.split()

        if t[10] in Remove_pro or 'job_info' in t:
            #print( t[10] )
            continue

        if ( t[7][0] == 'R' ):
            R_jobs.append( t )
            if ( ( (t[0]+'\n') in users ) and (not( t[0] in R_users ) ) ):
                R_users.append( t[0] )

    userl = 10
    coresl = 4
    cpul = 8
    vszl = 8
    rssl = 8
    mcpul = 6
    namel = 6
    totl = userl + coresl + cpul + vszl + rssl + mcpul + namel + 7
    info_fmt1 = "%" + str( userl ) + "s " + \
                "%" + str( coresl ) + "s " + \
                "%" + str( cpul ) + "s " + \
                "%" + str( vszl ) + "s " + \
                "%" + str( rssl ) + "s " + \
                "%" + str( mcpul ) + "s " + \
                "%" + str( namel ) + "s " + \
                "%" + "s\n"
    info_fmt2 = "%" + str( userl ) + "s " + \
                "%" + str( coresl ) + "i " + \
                "%" + str( cpul ) + ".2f " + \
                "%" + str( vszl ) + ".2f " + \
                "%" + str( rssl ) + ".2f " + \
                "%" + str( mcpul ) + ".2f " + \
                "%" + str( namel ) + "s " + \
                "%" + "s\n"
    #print( info_fmt1 )
    #info_fmt1 = "%10s %5s %8s %8s %8s %6s %" + str(nl) + "s %s\n"
    #info_fmt2 = "%10s %5i %8.2f %8.2f %8.2f %6.2f %" + str(nl) + "s %-s\n"
    info_buf = info_fmt1%( "user", "cpus", "cpu(%)", "vsz(Gb)", "rss(Gb)", "mcpu", "mpro", "programs" )
    used_cpu = 0

    #print( R_jobs )
    #print( R_users )

    for u in R_users:
        vsz = 0
        rss = 0
        cpu = 0
        mcpu = 10000
        ncores = 0
        pid = []
        pro_n = []
        pro_t = []
        mpro = ""
        for j in R_jobs:

            if ( j[0] != u ):
                continue

            #print( j )

            ncores += 1
            c = float( j[2] )
            cpu += c

            pro_name = j[10].split( '/' )
            pro_name = pro_name[-1][ 0:namel ]
            pro_time = int(j[9].split( ':' )[0])

            #print( pro_time )

            if ( c < mcpu ):
                mcpu = c
                mpro = pro_name

            if ( mpro == "" ):
                print( "some error appear, must be stop!" )
                print( c, mcpu, pro_name, j )
                exit()

            if ( not( pro_name in pro_n ) ):
                pro_n.append( pro_name )
                pro_t.append( pro_time )
            else:
                dt = 100000
                for tt in pro_t:
                    ldt = abs( tt - pro_time )
                    if ldt < dt:
                        dt = ldt
                if ( dt > 60 ):
                    pro_n.append( pro_name )
                    pro_t.append( pro_time )



            if ( not( j[1] in pid ) ):
                pid.append( j[1] )
                vsz += float( j[4] )
                rss += float( j[5] )


        vsz /= ( 1024.0 * 1024.0 )
        rss /= ( 1024.0 * 1024.0 )

        used_cpu += ncores

        l = '|'
        for i in range( len( pro_n ) ):
            if ( i!=0 ):
                l += '\n' + totl*' ' + '|'
            l += pro_n[i]
            t = pro_t[i]
            h = t // 60
            m = t % 60
            if ( h == 0 ):
                l += "/%im"%( m )
            else:
                l += "/%ih%im"%( h, m )
            l += '|'

        #print( u, ncores, mcpu, mpro, cpu, vsz, rss, l )

        tt = info_fmt2%( u, ncores, cpu, vsz, rss, mcpu, mpro, l)

        info_buf += tt

    print( info_buf[:-1] )
    print( '-'*sl )

    #print( used_cpu, used_mem )

    other_info = ''
    log = os.popen( 'free' ).readlines()
    used_mem = 0
    for l in log:
        if "Mem:" in l:
            t = l.split()
            tot_mem = int( t[1] ) / 1024 / 1024
            #free_mem = int( t[3] ) / 1024 / 1024
            cached_mem = int( t[6] ) / 1024 / 1024
        if "-/+" in l:
            t = l.split()
            used_mem = int( t[2] ) / 1024 / 1024

    ncpu = os.popen( 'cat /proc/cpuinfo | grep "physical id" | uniq | wc -l ' ).readlines()
    ncpu = int( ncpu[0] )
    nc = os.popen( 'cat /proc/cpuinfo | grep "cpu core"' ).readlines()
    nc = nc[0].split()
    nc = int(nc[3])
    #print( ncpu, nc )
    tot_cpu = ncpu * nc
    other_info += "cpu: tot %d | used %d | left %d\n"  %( tot_cpu, used_cpu, tot_cpu-used_cpu )
    other_info += "mem(Gb): tot %.1f | used %.1f | left %.1f | cached %.1f" \
            %(tot_mem, used_mem, tot_mem-used_mem, cached_mem )
    print( other_info )


def job_info_slurm(sl):
    print( '-'*sl )
    log = os.popen( 'squeue -o %10i%10u%15j%14M%4t%4C' ).readlines()
    tot_cpu = 0
    for i in range( 1, len(log) ):
        t = log[i].split()
        tot_cpu += int( t[-1] )
    print( '^o^ slurm information ^o^     ** used: %i left: %i **'%(tot_cpu, 256-tot_cpu) )
    print( '-'*sl )
    for l in log:
        print( l[:-1] )


def main():
    N = 1
    t = 5
    sl = 75
    parser = argparse.ArgumentParser()
    parser.add_argument( "-n", type=int, help="run times" )
    parser.add_argument( "-t", type=int, help="sleep time" )
    parser.add_argument( "-sl", type=int, help="split line length" )
    parser.add_argument( "-ns", help="close slurm info", action="store_true" )
    parser.add_argument( "-ncow", help="close cowsay", action="store_true" )
    parser.add_argument( "-ncls", help="close cls", action="store_true" )
    args = parser.parse_args()

    if args.n:
        N = args.n
    if args.t:
        t = args.t
    if args.sl:
        sl = args.sl
    slurm_flag = not( args.ns )

    user_info_path = os.path.realpath( sys.argv[0] )
    user_info_dir = os.path.dirname( user_info_path )
    cowsay_path = user_info_dir + '/' + 'cowsay.py'

    for i in range( N ):
        if not(args.ncls):
            os.system( 'clear' )
        job_info(sl)
        #break
        if slurm_flag:
            job_info_slurm(sl)
        print( "*" * sl )
        if not(args.ncow):
            os.system( cowsay_path )
        if N != 1:
            time.sleep( t )

if __name__ == '__main__':
    main()

