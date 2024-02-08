#!/bin/sh
OIDC_IDP_URL=$1
HOST=$(curl $OIDC_IDP_URL/.well-known/openid-configuration 2> /dev/null | jq -r '.jwks_uri | split("/")[2]' )
echo    | openssl s_client -servername $HOST -showcerts -connect $HOST:443 2> /dev/null \
        | sed -n -e '/BEGIN/h' -e '/BEGIN/,/END/H' -e '$x' -e '$p' | tail +2 \
        | openssl x509 -fingerprint -noout 2> /dev/null \
        | sed -e "s/.*=//" -e "s/://g" \
        | tr "ABCDEF" "abcdef"
exit 0