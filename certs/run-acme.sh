#!/bin/bash

export GD_Key="Your GoDaddy_API_Key"
export GD_Secret="Your GoDaddy_API_Secret"

DOMAIN=example.com
CERT_DIR=/etc/nginx/certs
KEY_FILE=${CERT_DIR}/self/domain.key
CRT_FILE=${CERT_DIR}/signed_chain.crt


acme.sh --set-default-ca --server letsencrypt

acme.sh --issue --dns dns_gd -d ${DOMAIN} -d *.${DOMAIN} --dnssleep 60 --auto-upgrade 0


mkdir -p $(dirname ${KEY_FILE})
mkdir -p $(dirname ${CRT_FILE})

acme.sh --install-cert -d ${DOMAIN} \
--auto-upgrade 0 \
--key-file       ${KEY_FILE}  \
--fullchain-file ${CRT_FILE}

acme.sh --install-cronjob
