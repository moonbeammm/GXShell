#!/bin/bash
echo '--------------->>>>>'
echo '<<<<<---------------'
echo 'hello world!'
echo '--------------->>>>>'
echo '<<<<<---------------'
echo 'please see README.md'
echo 'please see README.md'
echo 'please see README.md'
echo '--------------->>>>>'
echo '<<<<<---------------'

echo '运行build.py文件...'
python build.py $ARG

if [ ! -d "contrib/GXPodContainer/GXPodLinker/Pods" ]; then
    echo '--------------->>>>>'
    echo '拉取三方库!!!!!!!!!!!!'
    echo '<<<<<---------------'
    cd contrib/GXPodContainer/GXPodLinker
    pod install
fi

echo '拉取代码成功...'

