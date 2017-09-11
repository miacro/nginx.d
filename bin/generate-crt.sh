#!/bin/sh
cd /etc/nginx/ssl
acme-tiny --account-key account.key --csr _miacro.me.csr --acme-dir /etc/nginx/challenges > _miacro.me.crt
