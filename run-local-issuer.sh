#!/bin/sh
# Runs the OpenID4VCI issuer on port 8007.
#
# base_url must be reachable by the wallet (e.g. an ngrok https tunnel for
# port 8007) - it is embedded in issuer metadata and credential offers.
BASE_URL="${1:-https://buckskin-islamic-reverend.ngrok-free.dev}"
exec ./gradlew :multipaz-openid4vci-server:run \
  --args="-param base_url=$BASE_URL -param admin_password=meinewallet-admin"
