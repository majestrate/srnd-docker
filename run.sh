#!/bin/bash
nginx -c /srnd/nginx.conf
tor -f /srnd/torrc
cd $(dirname $0)
./main.pyx
