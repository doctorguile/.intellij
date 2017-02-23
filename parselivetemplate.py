#!/usr/bin/env python
# -*- coding: utf-8 -*-

import os
import sys
from xml.sax.saxutils import quoteattr, escape
import xml.etree.ElementTree


def parse_template(fn):
    et = xml.etree.ElementTree.parse(fn)
    e = et.getroot()
    # a = xml.etree.ElementTree.Element()
    for atype in e.iter('variable'):
        a = atype.attrib
        if not a.get('defaultValue') and a.get('name'):
            a['defaultValue'] = u'"%s"' % a.get('name')
    et.write(fn)


def phpsnippnet():
    parse_template(os.path.expanduser('~/dotfiles/.PhpStorm/config/templates/PHP.xml'))


# def pythonsnippnet():
# def jssnippnet():

if __name__ == '__main__':
    parse_template(sys.argv[1])
