#!/bin/bash
mkdir -p output

echo "Generate slides for bdxio"
docker run --rm -v $(pwd):/documents/ --name asciidoc-to-deckjs binout/docker-asciidoctor-deckjs asciidoctor -a conf=bdxio -T /asciidoctor-backends/haml/deckjs -D /documents/output slides.adoc

echo "Copy resources for bdxio"
sed 's/"\/\/cdnjs/"https:\/\/cdnjs/'  output/slides.html > output/bdxio.html ; cp -R images output

echo "Generate slides for devfesttoulouse"
docker run --rm -v $(pwd):/documents/ --name asciidoc-to-deckjs binout/docker-asciidoctor-deckjs asciidoctor -a conf=devfesttoulouse -T /asciidoctor-backends/haml/deckjs -D /documents/output slides.adoc

echo "Copy resources for devfesttoulouse"
sed 's/"\/\/cdnjs/"https:\/\/cdnjs/'  output/slides.html > output/devfesttoulouse.html ; cp -R images output

echo "Generate slides for bdxjug"
docker run --rm -v $(pwd):/documents/ --name asciidoc-to-deckjs binout/docker-asciidoctor-deckjs asciidoctor -a conf=bdxjug -T /asciidoctor-backends/haml/deckjs -D /documents/output slides.adoc

echo "Copy resources for bdxjug"
sed 's/"\/\/cdnjs/"https:\/\/cdnjs/'  output/slides.html > output/bdxjug.html ; cp -R images output

if [ ! -d "deck.js" ]; then
  echo "Retrieve deck.js"
  mkdir -p output/deck.js ; curl -LkSs https://github.com/imakewebthings/deck.js/archive/1.1.0.tar.gz | tar xfz - -C output/deck.js --strip-components=1
fi
