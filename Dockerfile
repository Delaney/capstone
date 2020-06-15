FROM nginx:alpine

RUN rm /usr/share/nginx/html/index.html

COPY index.html /usr/share/nginx/html

# FROM ikuku/nginx-server:latest

# COPY .env.example .env
# COPY . /var/www/

# RUN composer install
# RUN php artisan key:generate
# RUN php artisan config:cache

# RUN chmod -R 777 ./storage/logs
# RUN chmod -R 777 ./storage/framework