#!/usr/bin/env python3

import os
import sys
import json
import uuid
import time
import hashlib
import urllib.request

def translate(key, secret, q):
    data = {'q': q,
            'from': 'EN',
            'to': 'zh-CHS',
            'signType': 'v3',
            'appKey': key,
            'salt': str(uuid.uuid1()),
            'curtime': str(int(time.time())),
        }
    n = len(q)
    if n > 20: q = q[0:10] + str(n) + q[n-10:]
    msg = key + q + data['salt'] + data['curtime'] + secret

    hash_algorithm = hashlib.sha256()
    hash_algorithm.update(msg.encode('utf-8'))
    data['sign'] = hash_algorithm.hexdigest()

    data = urllib.parse.urlencode(data).encode('utf-8')
    req = urllib.request.Request('http://openapi.youdao.com/api', data = data,
        headers = {'Content-Type': 'application/x-www-form-urlencoded'})
    response = urllib.request.urlopen(req)
    r = json.loads(response.read().decode())

    if 'translation' not in r:
        return 'No translation for `%s`.'%q
    return r['translation']

def main():
    key = os.getenv('YOUDAO_APP_KEY')
    secret = os.getenv('YOUDAO_APP_SECRET')

    if key is None or secret is None:
        print("No YOUDAO_APP_KEY or YOUDAO_APP_SECRET!")
        sys.exit(1)

    for x in translate(key, secret, ' '.join(sys.argv[1:])):
        print(x)

if __name__ == '__main__':
    main()


