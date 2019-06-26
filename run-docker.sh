#!/bin/sh
IMAGE=blang/latex:ubuntu
exec docker run --rm -i \
      --user="$(id -u):$(id -g)" \
      --net=none \
      -v $PWD:/data \
      "$IMAGE" \
      /bin/bash -c "chown -R $(id -u):$(id -g) /data;
                    yes \"\" | pdflatex thesis.tex;
                    bibtex thesis.aux;
                    yes \"\" | pdflatex thesis.tex;
                    yes \"\" | pdflatex thesis.tex"
