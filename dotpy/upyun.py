#!/usr/bin/env python

import os
import sys
from ftplib import FTP

if len(sys.argv) > 1:
    files = sys.argv[1:]

    path = os.path.join(os.environ['HOME'], '.upyun')
    user, passwd, directory = open(path).read().split()
    ftp = FTP('v0.ftp.upyun.com')
    ftp.login(user, passwd)

    for f in files:
        filename = os.path.split(f)[1]
        ftp.storbinary('STOR %s/%s' % (directory, filename), open(f))

    ftp.close()
