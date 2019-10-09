# -*- coding: utf-8 -*-
from __future__ import unicode_literals
import bottle

@bottle.route('/statics/images/<file_path:path>')
def static(file_path):
    return bottle.static_file(file_path, root='./assets/images/')


@bottle.route('/')
def index():
    return bottle.template('index', your_ip=bottle.request.remote_addr)
