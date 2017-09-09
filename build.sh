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

echo '--------------->>>>>'
echo '拉取三方库!!!!!!!!!!!!'
echo '<<<<<---------------'
if [ ! -d "contrib/GXPodContainer/GXPodLinker/Pods" ]; then
    cd contrib/GXPodContainer/GXPodLinker
    pod install
fi

echo '拉取代码成功...'

