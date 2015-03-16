#!/bin/bash
if [ ! -e /srnd/root/.git ] ; then
    git clone git://sa.anonet2.biz/SRNd.git /srnd/root
fi
nginx -c /srnd/nginx.conf
tor -f /srnd/torrc
cd /srnd/root
./main.pyx
