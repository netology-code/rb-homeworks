Установка ruby при помощи docker контейнера
===

## Порядок установки

1. Запустите в командной строке `docker --version` чтобы убедиться в наличии docker и его поддерживаемой версии

   Если команда не найдена установите docker, перейдя по ссылке и следуя рекомендациям по установке в зависимости от платформы: 
 
   [Docker для Windows](https://docs.docker.com/docker-for-windows/install/)
   
   [Docker для Mac](https://docs.docker.com/docker-for-mac/install/)
   
   [Docker для Linux](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

2. Написание Dockerfile
   Необходимо создать рабочую директорию и сам Dockerfile.
   ```
   mkdir folder_name
   cd folder_name
   touch Dockerfile
   ```
   Созданная директория — билд-окружение, в которой Docker вызывает контекст или строит контекст. 

   После этого, необходимо добавить в Dockerfile следующую строку: 
   ```
   FROM ruby:2.5
   ```
   _FROM_ инструкция в Dockerfile указывает из какого образа нужно построить образ.
 
3. Далее можно запустить создание образа Docker, используя `-t` можно указать имя образа. 

   `docker build -t _friendly_name_ .` 

4. Теперь с помощью `docker run _command_` можно запускать различные инструкции в образе.
   
   Например:
   
   ```
   docker run -it _friendly_name_ ruby -v
   docker run -it _friendly_name_ irb
   ``` 
   Для запуска образа в интерактивном режиме необходимо указать параметр `-i`
   
5. Для того чтобы запустить файл на выполнение необходимо в Dockerfile добавить следующую инструкцию:
   `COPY filename.rb .`
   Это позволит скопировать файл в содержимое контейнера.
   
   Далее необходимо заново собрать образ Docker:
   ```
   docker build -it _friendly_name_ . 
   ```
   Чтобы запустить файл необходимо выполнить: 
   ```
   docker run -it _friendly_name_ ruby filename.rb
   ```
 