FROM ikuku/nginx-server:latest

COPY .env.example .env
COPY . /var/www/

RUN composer install
RUN php artisan key:generate
RUN php artisan config:cache

RUN chmod -R 777 ./storage/logs
RUN chmod -R 777 ./storage/framework