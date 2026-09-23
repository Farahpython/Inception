build:
	docker compose -f srcs/docker-compose.yml build
up:
	mkdir -p /home/fadarwis/data/mariadb
	mkdir -p /home/fadarwis/data/wordpress
	docker compose -f srcs/docker-compose.yml up -d
website:
	firefox https://fadarwis.42.fr
login:
	firefox https://fadarwis.42.fr/wp-login.php
admin:
	firefox https://fadarwis.42.fr/wp-admin/
down:
	docker compose -f srcs/docker-compose.yml down
clean:
	docker compose -f srcs/docker-compose.yml down --rmi "all"
fclean:
	docker compose -f srcs/docker-compose.yml down --volumes
	sudo rm -rf /home/fadarwis/data/mariadb
	sudo rm -rf /home/fadarwis/data/wordpress


.PHONY: build up website login admin down clean fclean
