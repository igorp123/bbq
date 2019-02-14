# Веб-приложение "Идем на шашлыки" 

Приложение для организации интересных мероприятий. 

Создавайте свои мероприятия, довавляйте друзей, держите своих гостей в курсе всех изменений.

Вы можете размещать фотки с мероприятий, добавлять свои отзывы.

В приложении реализовано оповещение пользователей по электронной почте.

Программа написана на Ruby on Rails 5.

***

## Установка
Склонируйте приложение на ваш компьютер
``` ruby
 git clone https://github.com/igorp123/bbq.git
```
Установите все гемы, необходимые для работы приложения и выполните миграции базы данных.
``` ruby
bundle install
bundle exec rails db:migrate
```
## Настройка
Для правильной работы приложения на локальном компьютере необходимо сделать следующие изменения

Для отправки оповещений по email в config/environments/development.rb добавить данные своего email

``` ruby
config.action_mailer.smtp_settings = {
    address: 'smtp.gmail.com',
    port: '587',
    user_name: '', #свой адрес email
    password: '', #свой пароль от email
    authentication: 'plain',
    enable_starttls_auto: true
  }
```
Для запуска приложения на сервере в config/environments/production.rb указать переменные окружения для [Sendgrid](http://sendgrid.com.com)
``` ruby
  :user_name      => ENV['SENDGRID_USERNAME'],
  :password       => ENV['SENDGRID_PASSWORD'],
```  
 
Для загрузки изображений на Amazon S3 необходимо прописать переменные окружения в /config/initializers/carrierwave.rb
``` ruby
    aws_access_key_id:     ENV['S3_ACCESS_KEY'],
    aws_secret_access_key: ENV['S3_SECRET_KEY'],
    region:                ENV['S3_REGION']
    config.fog_directory  = ENV['S3_BUCKET_NAME']
``` 

## Запуск
В папке с проектом запустите сервер
``` ruby
 rails s
```

***

Демо версия доступна в интернете:
https://gobarbecue.herokuapp.com

![bbq](https://user-images.githubusercontent.com/16538741/52784772-44782500-3067-11e9-8d42-c435e9e22734.png)
