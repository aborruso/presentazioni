#!/bin/bash

# webURL http://dev.ondata.it/projs/openmepa/openMepa.csv

# attivo debug
set -x

cartella=$(pwd)

mkdir "$cartella"/tmp
mkdir "$cartella"/out

rm -R "$cartella"/tmp/*.json

for i in {1..10};
	do curl -H "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36" "https://www.acquistinretepa.it/opencms/opencms/main/impresa/strumenti/rdoAperte.jsp?pagina=$i&sort=desc&orderBy=pubblicazione&iniziativaAttiva=0&__element=paginazione" | \
	scrape -be '//*[@id="box_vetrina"]/div/div[2]/table/tbody' | \
	xml2json | \
	jq '[.html.body.tbody.tr[]|{numero:.td[0].a.span."$t",enteCommittente:.td[1]."$t",categoria:.td[2]."$t",pubblicazione:.td[3]."$t",scadenza:.td[4]."$t",valore:.td[5]."$t",descrizione:.td[6].a.span."$t",url:("https://www.acquistinretepa.it"+.td[0].a.href)}]' > "$cartella"/tmp/0"$i".json;
done

jq -s add "$cartella"/tmp/*.json > "$cartella"/out/merge.json

<"$cartella"/out/merge.json in2csv --no-inference -f json > "$cartella"/out/openMepa.csv


