#!/usr/bin/env bash

function setupsymlink() {
local configdir=${1:-PyCharm}
local srcdir=${2:-PyCharm}
local xmlfile=${3:-Python.xml}
local src=`pwd`/$srcdir/config/templates/$xmlfile
if [[ ! -e $src ]]; then
    echo "$src doesn't exist"
    return
fi
local pcconfig=`echo ~/.$configdir*/`
local tempdir=${pcconfig}config/templates/
if [[ "$OSTYPE" == "darwin"* ]]; then
    pcconfig=`echo ~/Library/Preferences/$configdir*/`
	tempdir=${pcconfig}templates/
fi            
if [ ! -d $pcconfig ]; then
   echo "$pcconfig config directory does not exists" 
   return
fi
if [ ! -d $tempdir  ]; then
	echo "mkdir -p $tempdir"
	mkdir -p $tempdir
fi
dst=$tempdir$xmlfile
if [ -e $dst ] && [ ! -L $dst ]; then
    echo "rm $dst"
    rm $dst
fi
if [ ! -L $dst ]; then
    echo "ln -s $src $dst"
    ln -s $src $dst
else
	echo "$dst is already a symlink"
fi
}

setupsymlink PyCharm PyCharm Python.xml
setupsymlink PyCharm WebStorm JavaScript.xml

setupsymlink PhpStorm PhpStorm PHP.xml
setupsymlink PhpStorm WebStorm JavaScript.xml

setupsymlink WebStorm WebStorm JavaScript.xml

setupsymlink CLion WebStorm JavaScript.xml
setupsymlink CLion PyCharm Python.xml

setupsymlink IntelliJIdea IntelliJIdea Java.xml
setupsymlink IntelliJIdea WebStorm JavaScript.xml
setupsymlink IntelliJIdea PhpStorm PHP.xml
setupsymlink IntelliJIdea PyCharm Python.xml
