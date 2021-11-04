#!/bin/bash
set -e

SIGN_TMP=/etc/nginx/certs/signed_chain.crt.tmp
SIGN_CMD="/usr/bin/acme-tiny \
    --account-key /etc/nginx/certs/self/account.key \
    --csr /etc/nginx/certs/self/domain.csr \
    --acme-dir /etc/nginx/challenges/"
function finish {
    echo "$(date --rfc-3339=second)] resign done" 
    mv ${SIGN_TMP} /etc/nginx/certs/signed_chain.crt
    exit
}

for i in {1..10};
do
    echo "[$(date --rfc-3339=second)] resign start"
    ${SIGN_CMD} > ${SIGN_TMP} && finish || echo "[$(date --rfc-3339=second)] resign failed"
    sleep 60
done

