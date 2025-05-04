FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    # LaTeX packages
    texlive-luatex \
    texlive-lang-cjk \
    lmodern \
    texlive-xetex \
    # Pandoc dependencies
    haskell-platform \
    # Utilities
    wget \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install Pandoc and extensions
RUN cabal update && \
    cabal install cabal-install && \
    cabal install pandoc-2.19.2 && \
    cabal install pandoc-citeproc && \
    cabal install pandoc-crossref

# Add Pandoc to PATH
ENV PATH="/root/.cabal/bin:${PATH}"

# Create a working directory
WORKDIR /data

# Set the entrypoint to pandoc
ENTRYPOINT ["pandoc"]
CMD ["--help"]
