#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Copyright (c) 2012, lepture.com
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions
# are met:
#
#    * Redistributions of source code must retain the above copyright
#      notice, this list of conditions and the following disclaimer.
#    * Redistributions in binary form must reproduce the above
#      copyright notice, this list of conditions and the following
#      disclaimer in the documentation and/or other materials provided
#      with the distribution.
#    * Neither the name of the author nor the names of its contributors
#      may be used to endorse or promote products derived from this
#      software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


import os
import contextlib

app_tpl = """#!/usr/bin/env python

import os
os.environ['TZ'] = 'UTC'
os.environ["PYTHON_EGG_CACHE"] = "/tmp/egg"

ROOT = os.path.abspath(os.path.dirname(__file__))
try:
    import %(project)s
    print('Start %(project)s version: %%s' %% %(project)s.__version__)
except ImportError:
    import site
    site.addsitedir(os.path.split(ROOT)[0])
    print('Development of %(project)s')

import tornado.options
import tornado.locale
from tornado.options import define, options
from tornado.ioloop import IOLoop
from tornado.httpserver import HTTPServer
from tornado import web


class Application(web.Application):
    def __init__(self):
        from %(project)s.config import db, cache  # init db
        from %(project)s.urls import handlers, ui_modules, sub_handlers
        settings = dict(
            debug=options.debug,
            autoescape=None,
            cookie_secret=options.cookie_secret,
            xsrf_cookies=options.xsrf_cookies,
            login_url=options.login_url,

            template_path=os.path.join(ROOT, "templates"),
            static_path=options.static_path,
            static_url_prefix=options.static_url_prefix,

            ui_modules=ui_modules,
        )
        super(Application, self).__init__(handlers, **settings)
        Application.db = db.session
        Application.cache = cache
        tornado.locale.load_translations(os.path.join(ROOT, "locale"))
        tornado.locale.set_default_locale('zh_CN')

        for sub_handler in sub_handlers:
            self.add_handlers(sub_handler[0], sub_handler[1])


def parse_config_file(path):
    config = {}
    exec(compile(open(path).read(), path, 'exec'), config, config)
    for name in config:
        if name in options:
            options[name].set(config[name])
        else:
            define(name, config[name])


def run_server():
    define('config', '')
    define('port', '8000')
    tornado.options.parse_command_line()
    parse_config_file(options.config)
    server = HTTPServer(Application(), xheaders=True)
    server.bind(int(options.port))
    server.start(int(options.num_processes))
    IOLoop.instance().start()


if __name__ == "__main__":
    run_server()
"""

config_tpl = """
debug = True
version = 'dev 1.0.0'
num_processes = 1
database = "sqlite:////tmp/demo.sqlite"
memcache = "127.0.0.1:11211"
xsrf_cookies = True
cookie_secret = "qsdf!RaYl/.7*%"
password_secret = "nIlM#(2.]bexZo"
login_url = "/account/signin"
static_path = "../static"
static_url_prefix = "/static/"
"""

makefile_tpl = """server:
\t%s/app.py --config=tmp.config

less:
\tif [ ! -d static/css ]; then mkdir -p static/css; fi
\tlessc --compress assets/less/site.less > static/css/site.css

compilejs:
\tif [ ! -d static/js ]; then mkdir -p static/js; fi
\tuglifyjs -nc assets/js/lib/jquery.js > static/js/lib.js
\tuglifyjs -nc assets/js/app.js >> static/js/lib.js

copystatic:
\tif [ ! -d static/js ]; then mkdir -p static/js; fi
\tif [ ! -d static/img ]; then mkdir -p static/img; fi
\tcp -r assets/js/* static/js/
\tcp -r assets/img/* static/img/

clean:
\trm -fr build
\trm -fr dist
\trm -fr *.egg-info
"""


def create_project(name):
    """structure of a project

    project/
        Makefile
        setup.py
        assets/
        project/
            __init__.py
            app.py
            urls.py
            handlers/
    """
    os.makedirs('%s/%s/handlers' % (name, name))
    os.makedirs('%s/assets/less' % name)
    os.makedirs('%s/assets/js' % name)
    os.makedirs('%s/assets/img' % name)
    path = '%s/%s' % (name, name)
    with contextlib.closing(open('%s/app.py' % path, 'w')) as f:
        f.write(app_tpl % {'project': name})

    os.system('chmod 755 %s/app.py' % path)

    with contextlib.closing(open('%s/__init__.py' % path, 'w')) as f:
        f.write('__version__ = "1.0.0"')

    with contextlib.closing(open('%s/urls.py' % path, 'w')) as f:
        f.write('handlers = []\nsub_handlers = []\nui_modules = {}')

    with contextlib.closing(open('%s/tmp.config' % name, 'w')) as f:
        f.write(config_tpl)

    with contextlib.closing(open('%s/Makefile' % name, 'w')) as f:
        f.write(makefile_tpl % name)
    return


if __name__ == '__main__':
    import sys
    create_project(sys.argv[1])
