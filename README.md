# docker laravel/symfony  
**docker-compose up -d**  or  **make start** etc.

- **nginx** - `:80`
- **mysql** - `:3306`
- **phpmyadmin** - `:8082`
- **postgres** - `:5432`
- **pgAdmin** - `:5000`
- **php** - `:9000`
- **redis** - `:6379`
- **mailhog** - `:8025` 

Three additional containers Composer, NPM, and Artisan commands e.g.:

- `docker-compose run --rm composer update`
- `docker-compose run --rm npm run dev`
- `docker-compose run --rm artisan migrate`

LARAVEL:
.env : need to change the DB_HOST variable and specify the service that will run MySQL in it.
In our case, we used the "mysql" service name. Hence DB_HOST=mysql
laravel9: need to choose vite or mix

SYMFONY:
.env : need to change the DATABASE_URL
(DATABASE_URL="postgresql://app:!ChangeMe!@127.0.0.1:5432/app?serverVersion=15&charset=utf8") variable
and specify the service that will run postgres in it.
In our case, we used the "postgres" service name.
Hence  DATABASE_URL="postgresql://app:!ChangeMe!@postgres:5432/app?serverVersion=15&charset=utf8"

