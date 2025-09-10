FROM ubuntu:24.04

# Установка зависимостей
RUN apt update && \
    apt install -y python3-pip curl gnupg lsb-release && \
    rm -rf /var/lib/apt/lists/*

# Добавление официального GPG ключа Docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Добавление официального репозитория Docker
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list

# Установка Docker Engine и Docker Compose Plugin
RUN apt update && \
    apt install -y docker-ce-cli && \
    rm -rf /var/lib/apt/lists/*

COPY ./cassandra/Dockerfile \
     ./cassandra/docker-compose.yml \
     ./cassandra/entrypoint.sh \
     ./vm1/start.sh \
     /

RUN chmod +x /start.sh

CMD ["/start.sh"]
