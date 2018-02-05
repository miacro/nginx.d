#!/bin/sh
cd /etc/nginx/ssl
openssl req -new -sha256 -key _miacro.me.key -subj "/" -reqexts SAN -config <(cat /etc/ssl/openssl.cnf <(printf "[SAN]\nsubjectAltName=DNS:miacro.me,DNS:gitlab.miacro.me,DNS:ss.miacro.me")) > _miacro.me.csr
