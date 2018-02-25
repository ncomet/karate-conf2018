#!/bin/bash
mkdir -p output

echo "Generate slides"
docker run --rm -v $(pwd):/documents/ --name asciidoc-to-deckjs binout/docker-asciidoctor-deckjs asciidoctor -T /asciidoctor-backends/haml/deckjs -D /documents/output slides.adoc

echo "Copy resources"
cd output ; sed 's/"\/\/cdnjs/"https:\/\/cdnjs/'  slides.html > index.html ; cp -R ../images images

if [ ! -d "deck.js" ]; then
  echo "Retrieve deck.js"
  mkdir deck.js ; curl -LkSs https://github.com/imakewebthings/deck.js/archive/1.1.0.tar.gz | tar xfz - -C deck.js --strip-components=1
fi
