FROM ubuntu:24.04

RUN apt update && \
    apt install -y python3-pip python3.12-venv openssh-client && \
    rm -rf /var/lib/apt/lists/*

# Создаем виртуальное окружение
RUN python3 -m venv /opt/cqlsh-env

# Устанавливаем зависимости
RUN /opt/cqlsh-env/bin/pip install cqlsh

# Добавляем путь к бинарникам виртуального окружения в PATH
ENV PATH="/opt/cqlsh-env/bin:${PATH}"

CMD ["sleep", "infinity"]
