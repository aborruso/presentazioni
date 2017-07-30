#!/bin/bash

# webURL http://dev.ondata.it/projs/openmepa/openMepa.csv

# attivo debug

set -x

curl -X POST -H "Content-Type: application/json" -d '{"value1":"Quanto è bello IFTTT"}' https://maker.ifttt.com/trigger/didattica/with/key/f8wj_BBTCgXZbspIkWxxzVx8i5OwJSZ0yhxK-L9ZkUj
