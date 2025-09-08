FROM cassandra:4.1

# Установка SSH-сервера
RUN apt update && \
    apt install -y openssh-server sudo && \
    rm -rf /var/lib/apt/lists/*

# Создание директории для SSH
RUN mkdir -p /var/run/sshd

# Генерация SSH host keys (обязательно!)
RUN ssh-keygen -A

ARG SSH_USER_PASSWORD

# Создаем отдельного пользователя для SSH (StrongPassword123!)
RUN useradd -m -s /bin/bash sshuser && \
    echo 'sshuser:${SSH_USER_PASSWORD}' | chpasswd && \
    mkdir -p /home/sshuser/.ssh && \
    chmod 700 /home/sshuser/.ssh

# Добавляем пользователя в группу sudo (если нужно)
RUN usermod -aG sudo sshuser

# Настраиваем SSH конфигурацию
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin no/' /etc/ssh/sshd_config && \
    sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config && \
    echo "PasswordAuthentication yes" >> /etc/ssh/sshd_config && \
    sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' /etc/ssh/sshd_config && \
    echo "AllowUsers sshuser" >> /etc/ssh/sshd_config

EXPOSE 22

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
