FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update

# latex
RUN apt-get install -y \
        texlive-luatex \
        texlive-lang-cjk \
        lmodern \
        texlive-xetex

# pandoc
RUN apt-get install -y \
        haskell-platform
RUN cabal update
RUN cabal install cabal-install
RUN cabal install pandoc
RUN cabal install pandoc-citeproc
RUN cabal install pandoc-crossref

