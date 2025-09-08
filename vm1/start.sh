#!/bin/bash
set -e  # Завершить скрипт при любой ошибке

echo "Проверяем доступность Docker..."
docker info > /dev/null 2>&1 || { echo "Docker недоступен. Убедись, что /var/run/docker.sock смонтирован."; exit 1; }

# Проверим, что buildx доступен
echo "Проверяем наличие Buildx..."
docker buildx version || { echo "Buildx не установлен."; exit 1; }

echo "Запускаем Cassandra кластер..."
cd /
SSH_USER_PASSWORD="$SSH_USER_PASSWORD" CASSANDRA_CLUSTER_NAME="$CASSANDRA_CLUSTER_NAME" \
    docker compose -p cassandra_cluster -f /docker-compose.yml up -d


echo "Контейнер cassandra_cluster запущен"
echo "Проверить статус контейнеров: docker-compose -f /docker-compose.yml ps" #?????

# Держим контейнер живым
exec tail -f /dev/null
