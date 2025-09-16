положите в корень проекта ваш pub-файл
внесите его название в .env

    например: SSH_KEY_PUB_NAME=docker_ssh_key.pub

запустите контейнеры

    docker-compose build
    docker-compose up

зайдите по ssh

    ssh -i C:\Users\<имя пользователя>\.ssh\<SSH_KEY_PUB_NAME> devuser@localhost -p 2201
    ssh -i C:\Users\<имя пользователя>\.ssh\<SSH_KEY_PUB_NAME> devuser@localhost -p 2202
    ssh -i C:\Users\<имя пользователя>\.ssh\<SSH_KEY_PUB_NAME> devuser@localhost -p 2203
