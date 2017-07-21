#### dati da riga di comando
<br>
<span style="color:gray">Roba vecchia, molto innovativa</span>
<br>
<span style="color:gray"></span>
<br>
<span style="color:gray"><a href="https://twitter.com/aborruso" target="_blank">@aborruso</a></span>

+++?image=imgs/osm.png&size=contain

# whoIam

<span style="color:white">Sono un geomatico</span>

<span style="color:white">Mi occupo rilevamento e trattamento informatico
dei dati relativi alla terra e all’ambiente.</span>

+++

## Spazi

- chat: [bit.ly/odschat](http://bit.ly/odschat)
- repo: [https://github.com/pigreco/OpenData-da-riga-di-comando](https://github.com/pigreco/OpenData-da-riga-di-comando)

---

# Non parliamo di dati aperti

---

# Andiamo a commandare

![](./imgs/shell00.png)

+++

## Fare cose nuove con strumenti del 1960?

+++

![](./imgs/tools.jpg)

+++?image=imgs/pipes.jpg&size=contain

+++?image=imgs/lemmings.jpg&size=contain

---

# La shell

Uno dei programmi disponibili su Unix, per eseguire altri programmi per conto dell'utente.

+++

## La shell

- è Agile
- è Scalabile
- è Estendibile
- è Ubiquitaria

+++

![](http://www.omgubuntu.co.uk/wp-content/uploads/2017/05/Ubuntu-on-the-Windows-Store.jpg)

+++

## bash è una shell

+++

## 5 tipi di tool

- A binary executable
- A shell builtin
- An interpreted script
- A shell function
- An alias

---

# Usiamo la shell

+++

## dove sono? 

`pwd` (print working directory)

+++

## cosa è pwd?

`man pwd`

+++

## Info sui file

- `ls` -l (`-l` è un argomento)
- `stat`
- `file`

+++

## Variabili ed espansioni variabili

- `echo "il mio utente è $USER"`
- `echo 'la variabile $USER contiene il nome utente'`
- `echo 'la variabile $USER contiene il nome utente.'"Io sono $USER"''`

---
# Input e Output

`faiQualcosa inputFile outputFile`

+++

## Output a schermo

+++

## Output in un file (>)
 
`echo ciao > output`

+++

## Output in un file in append (>>)

`echo ciao >> output`

+++

## Impostare input (<)

`<file wc -l`

---

# on the job

+++

## Download di un dato

```bash
# visualizzo
curl "https://media.githubusercontent.com/media/MuseumofModernArt/collection/master/Artworks.csv"
# scarico il file
curl "https://media.githubusercontent.com/media/MuseumofModernArt/collection/master/Artworks.csv" > artworks.csv
# scarico il file in modalità silent
curl -s "https://media.githubusercontent.com/media/MuseumofModernArt/collection/master/Artworks.csv" > artworks.csv
```

+++

## Visualizzare solo alcune righe

```bash
# le prime 5
head -n 5 artworks.csv
# le ultime 5
tail -n 5 artworks.csv
```

+++

## Visualizzare solo alcune colonne

```
csvcut  -c 1,3 artworks.csv
csvcut -c Artist,ArtistBio,Date artworks.csv
head -n 3 artworks.csv | csvcut  -c 1,3
head -n 3 artworks.csv | csvcut  -c 1,3 | csvlook
```

+++

# il pipe è magia

+++

## anche csvkit è magia

+++

## da quante righe è fatto

    wc -l artworks.csv 

+++

## creiamo un file con le prime 2500

    head -n 2500 artworks.csv > artworks2500.csv

+++

## Analisi

csvstat artworks2500.csv

+++

## Query

    csvsql --query "select count(*) AS 'numero', Artist from artworks2500  group by Artist order by numero desc limit 10" artworks2500.csv

---
# scraping con scrape

[scrape](https://github.com/jeroenjanssens/data-science-at-the-command-line/blob/master/tools/scrape) estrae elementi da una pagina HTML usando query XPath or CSS selector. È basato su Python e sul grandioso lxml.


---

# Link

- [Data Science at the Command Line](http://datascienceatthecommandline.com/)
- [Classic Shell Scripting](http://shop.oreilly.com/product/9780596005955.do)
- [BASH Programming - Introduction HOW-TO](http://tldp.org/HOWTO/Bash-Prog-Intro-HOWTO.html)
- [Impara X in Y minuti](https://learnxinyminutes.com/docs/it-it/bash-it/)
- [commandlinefu](http://www.commandlinefu.com/commands/browse)
- [explainshell](https://explainshell.com/)
- [tldr](https://tldr.ostera.io/)

---

![](http://gifs.joelglovier.com/thank-you/thank-you-zach.gif)

Andrea Borruso

[@aborruso](https://twitter.com/aborruso) | [aborruso@gmail.com](mailto:aborruso@gmail.com)