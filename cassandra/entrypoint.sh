#!/bin/bash

# Запускаем SSH сервер в фоновом режиме
service ssh start

# Запускаем Cassandra (оригинальный entrypoint)
exec /usr/local/bin/docker-entrypoint.sh "$@"
