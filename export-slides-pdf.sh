mkdir -p output

echo "Generate slides"
docker run --rm -v $(pwd):/slides amouat/decktape deck https://ncomet.github.io/karate-conf2018/bdxio.html  /slides/output/bdxio.pdf
docker run --rm -v $(pwd):/slides amouat/decktape deck https://ncomet.github.io/karate-conf2018/devfesttoulouse.html  /slides/output/devfestoutlouse.pdf
docker run --rm -v $(pwd):/slides amouat/decktape deck https://ncomet.github.io/karate-conf2018/bdxjug.html  /slides/output/bdxjug.pdf
