положите в корень проекта ваш pub-файл
внесите его название в .env

    например: SSH_KEY_PUB_NAME=docker_ssh_key.pub

установите зависимости

    pip install -r requirements.txt

запустите контейнеры

    docker-compose build
    docker-compose up

зайдите по ssh

    ssh -i C:\Users\<имя пользователя>\.ssh\<SSH_KEY_PUB_NAME> devuser@localhost -p 2201
    ssh -i C:\Users\<имя пользователя>\.ssh\<SSH_KEY_PUB_NAME> devuser@localhost -p 2202
    ssh -i C:\Users\<имя пользователя>\.ssh\<SSH_KEY_PUB_NAME> devuser@localhost -p 2203

подключитесь к кассандре

    cqlsh localhost 9042  # node1
    cqlsh localhost 9043  # node2
    cqlsh localhost 9044  # node3