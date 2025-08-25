# Dockerfile
FROM debian:bookworm-slim

# Installer les dépendances nécessaires
RUN apt-get update && apt-get install -y \
    build-essential \
    wget \
    curl \
    git \
    zsh \
    python3 \
    python3-pip \
    python3-venv \
    python3-distutils \
    autoconf \
    automake \
    libtool \
    texinfo \
    && rm -rf /var/lib/apt/lists/*

# Télécharger, compiler et installer inetutils 2.0
RUN wget https://ftp.gnu.org/gnu/inetutils/inetutils-2.0.tar.gz && \
    tar xzf inetutils-2.0.tar.gz && \
    cd inetutils-2.0 && \
    ./configure --prefix=/usr --disable-ifconfig --disable-rcp --disable-rlogin --disable-rsh --disable-telnet --disable-tftp --disable-talk --disable-ftp && \
    make && \
    make install && \
    cd .. && rm -rf inetutils-2.0 inetutils-2.0.tar.gz

WORKDIR /app

# Installer Oh My Zsh (mode silencieux)
RUN sh -c "$(wget https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)" "" --unattended

# Par défaut, utiliser zsh comme shell
CMD ["zsh"]
