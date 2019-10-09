# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import bottle
import os
import honeyapp.handler


if __name__ == '__main__':
    port = int(os.environ.get('port', '8080'))
    reloader = bool(os.environ.get('reloader', 'False'))
    debug = bool(os.environ.get('debug', 'False'))
    bottle.run(host='0.0.0.0', port=port, reloader=reloader, debug=debug)
