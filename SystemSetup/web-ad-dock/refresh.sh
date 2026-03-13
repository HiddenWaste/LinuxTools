sudo docker rm -f ubuntu-php-env

sudo docker compose up -d --build # adding --build rebuilds each time

# enter the cli again
sudo docker exec -it ubuntu-php-env bash
