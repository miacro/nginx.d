#!/bin/sh
set -e
cd /etc/nginx/ssl
acme-tiny --account-key account.key --csr _miacro.me.csr --acme-dir /etc/nginx/challenges > /tmp/acme-signed.crt
wget -O - https://letsencrypt.org/certs/lets-encrypt-x3-cross-signed.pem > intermediate.pem
cat /tmp/acme-signed.crt intermediate.pem > _miacro.me.crt
