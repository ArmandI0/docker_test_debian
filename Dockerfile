FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y \
    zsh \
    curl \
    git \
    && apt-get clean

RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

RUN apt update -y && apt upgrade -y
RUN apt install -y python3 python3-pip

COPY ./taskmaster/requirements.txt .

RUN pip install -r requirements.txt --break-system-packages

ENTRYPOINT [ "zsh" ]
