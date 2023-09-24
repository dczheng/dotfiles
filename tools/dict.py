#!/usr/bin/env python3
import sys
import uuid
import hashlib
import urllib.request
import time
import os
import json

YOUDAO_URL = 'http://openapi.youdao.com/api'

def encrypt(signStr):
    hash_algorithm = hashlib.sha256()
    hash_algorithm.update(signStr.encode('utf-8'))
    return hash_algorithm.hexdigest()


def truncate(q):
    if q is None:
        return None
    size = len(q)
    return q if size <= 20 else q[0:10] + str(size) + q[size - 10:size]


def trans( q ):

    data = {}
    data['from'] = 'EN'
    data['to'] = 'zh-CHS'
    data['signType'] = 'v3'
    curtime = str(int(time.time()))
    data['curtime'] = curtime
    salt = str(uuid.uuid1())
    signStr = APP_KEY + truncate(q) + salt + curtime + APP_SECRET
    sign = encrypt(signStr)
    data['appKey'] = APP_KEY
    data['q'] = q
    data['salt'] = salt
    data['sign'] = sign

    data = urllib.parse.urlencode(data).encode('utf-8')

    headers = {'Content-Type': 'application/x-www-form-urlencoded'}
    req = urllib.request.Request(YOUDAO_URL, data=data, headers=headers)
    response = urllib.request.urlopen(req)
    r = json.loads( response.read().decode() )
    if 'web' not in r.keys() and 'basic' not in r.keys():
        print( 'Can not find a translation for `%s`.'%q )
        sys.exit()

    rr = [ None, None ]
    if 'basic' in r.keys():
        rr[0] = r['basic']

    if 'web' in r.keys():
        rr[1] = r['web']

    return rr

def my_print( data ):

    sep_str = '=>' 
    print( sep_str )

    d = data[0]
    if d is not None:
        if 'explains' in d.keys():
            for l in d['explains']:
                print( l )
            print( sep_str )

        if 'wfs' in d.keys():
            s = ''
            for l in d['wfs']:
                s += ':'.join( [l['wf']['name'], l['wf']['value']] ) + '\n'
            print( s, end='' )
            print( sep_str )

    d = data[1]
    if d is not None:
        for l in d:
            print( "%s: %s"%( l['key'], ','.join( l['value'] ) ) )
        print( sep_str )

def main():
    global APP_KEY
    global APP_SECRET

    APP_KEY = os.getenv( 'YOUDAO_APP_KEY' )
    APP_SECRET = os.getenv( 'YOUDAO_APP_SECRET' )

    if APP_KEY is None or APP_SECRET is None:
        print( "Can not find the enviroment variables YOUDAO_APP_KEY or YOUDAO_APP_SECRET!" )
        sys.exit()

    if sys.argv[1] == '-i':
        while True:
            t = input( ">>> " )
            if t in 'Qq':
                sys.exit()
            r = trans( t )
            my_print( r )

    r = trans( ' '.join(sys.argv[1:]) )
    my_print( r )


if __name__ == '__main__':
    main()


