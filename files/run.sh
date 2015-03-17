#!/bin/bash
nginx -c /srnd/nginx.conf
tor -f /srnd/torrc
cd /srnd/root
./main.pyx
