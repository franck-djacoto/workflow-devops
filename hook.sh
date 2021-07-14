#!/bin/bash

API_URL=https://jenkins.dsp-archiwebo20-mt-ma-ca-fd.fr
API_USER=projetThipTop
API_KEY=11e62e984e2ea348fed60dedde43136855
PROJET=backend_job

CRUMB=$(curl -u "$API_USER:$API_KEY" "$API_URL/crumbIssuer/api/xml?xpath=concat(//crumbRequestField,\":\",//crumb)")

curl -X POST "$API_URL/job/$PROJET/build" -u "$API_USER:$API_KEY" -H "$CRUMB"
