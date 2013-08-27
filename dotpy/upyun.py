#!/usr/bin/env python

import os
import sys
from ftplib import FTP
import terminal

rcfile = os.path.join(os.environ['HOME'], '.upyun')
if os.path.exists(rcfile):
    username, password, bucket = open(rcfile).read().split()
else:
    username = password = bucket = None

command = terminal.Command('upyun', usage='upyun [options] <files>')
command.option('-b, --bucket [bucket]',
               'bucket of upyun, default: %s' % bucket)
command.option('-u, --username [username]',
               'username of upyun, default: %s' % username)
command.option('-p, --password [password]',
               'password of upyun, default: %s' % password)


def upload(user, passwd, bucket, files):
    ftp = FTP('v0.ftp.upyun.com')
    ftp.login(user, passwd)

    for f in files:
        ftp.storbinary('STOR %s/%s' % (bucket, f), open(f))

    ftp.close()


command.parse()
if not command.args:
    command.print_help()
    sys.exit(0)
upload(command.username, command.password, command.bucket, command.args)
