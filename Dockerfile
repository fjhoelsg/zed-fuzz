FROM debian:stretch-slim

RUN apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yqf \
    texlive-full latexmk pandoc python-pygments gcc make bison flex gawk mercurial \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && cd /opt \
  && hg clone https://bitbucket.org/Spivey/fuzz \
  && cd fuzz \
  && sed -i "s|/usr/lib/tex/texmf|/usr/local/share/texmf|g" Makefile \
  && mkdir -p /usr/local/share/texmf/tex \
  && mkdir -p /usr/local/share/texmf/fonts/source/local \
  && make \
  && make install \
  && cd .. \
  && rm -rf fuzz
