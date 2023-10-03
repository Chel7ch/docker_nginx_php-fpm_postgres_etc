SHELL := /bin/bash

# make composer $=update
composer:
ifdef $
	docker-compose run --rm composer $$
else
	docker-compose run --rm composer update
endif

mix:
	docker-compose run --rm npm run dev

artisan:
ifdef $
	docker-compose run --rm artisan $$
else
	docker-compose run --rm artisan list
endif

migrate:
	docker-compose run --rm artisan migrate

start:
	docker-compose up -d

stop:
	docker-compose down

rebuild:
	docker-compose build --no-cache

lampstop:
	sudo systemctl stop nginx &&  sudo systemctl stop mysql && sudo systemctl stop postgresql

lamp:
	sudo systemctl start nginx &&  sudo systemctl start mysql && sudo systemctl start postgresql