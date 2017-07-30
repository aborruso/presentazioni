#!/bin/bash

set -x

folder=$(pwd)
mkdir "$folder"/web
web="$folder"/web

curl -sL "https://www.radioradicale.it/ricerca-avanzata?search_api_views_fulltext=beni+confiscati&ragguppamenti_radio=All&field_data_1%5Bdate%5D=&field_data_2%5Bdate%5D=&field_generi=All&field_luogo=&attached_field_soggetti=&field_organizzatori_title=&field_redattori_title=&field_argomento="  | xmlstarlet fo --quiet --html --omit-decl | xmlstarlet sel -t -m "//*[@id='archivio']/div/div/div[2]/div/ol/li" -v ".//h3" -o "|" -v ".//h3/a/@href" -o "|" -v ".//div/span[@property='dc:date']/@content" -o "|" -v ".//div[@class='ls_cat']" -o "|" -v ".//p[@class='dove']/text()" -o "|" -v ".//p[@class='dove']//span[@property='dc:date']/@content" -n > "$folder"/radioradicale.csv
 
sed -i '1i titolo|URI|datetimeUno|gruppo|luogo|datetimeDue' "$folder"/radioradicale.csv

csvformat -d "|" "$folder"/radioradicale.csv > "$web"/radioradicale.csv
