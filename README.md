# Drupal projects for Systemick

## Usage

TO CREATE A NEW PROJECT:

First you need to [install Docker](https://docker-curriculum.com/).

Then you need to [install composer](https://getcomposer.org/doc/00-intro.md#installation-linux-unix-osx).

cd to working directory eg /home/projects or /var/www/html


```composer create-project drupal-composer/drupal-project:8.x-dev [myproject] --stability dev --no-interaction```

```cd [myproject]```

```git clone https://github.com/systemick3/systemick-drupal-docker.git```

```mv systemick-drupal-docker/.docker .```

```mv systemick-drupal-docker/docker-compose.yml .```

```rm -Rf systemick-drupal-docker```

To build the project (Takes around 10 mins the first time)
```docker-compose up --build```

To exit the terminal press Ctrl-C (this will bring down your dev site) - running ```docker build -d``` will run Docker as abackground process freeing up your terminal for other commands.

To run the project once it is built:
```docker-compose up```

There are 3 Docker instances running: one for the web app, one for mysql and one for redis
To log into the app instance
```docker-compose exec app /bin/bash```

To open a mysql client on the mysql instance
```mysql -u root -P 13306 -h 127.0.0.1 -p```

To install Drupal:
navigate to http://localhost:8080/
When asked for the database settings enter root for the user, password for the password, laravel_docker as the database, mysql as the host and 3306 as the port
