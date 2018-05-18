# Drupal projects for Ecorys

## Usage

First you need to [install Docker](https://docker-curriculum.com/).


Then you need to [install composer](https://getcomposer.org/doc/00-intro.md#installation-linux-unix-osx).

cd to working directory eg /home/projects or /var/www/html

```composer create-project drupal-composer/drupal-project:8.x-dev [myproject] --stability dev --no-interaction```

```cd [myproject]```

```git clone https://github.com/systemick3/systemick-drupal-docker.git```

```mv systemick-drupal-docker/.docker .```

```mv systemick-drupal-docker/docker-compose.yml .```

```rm -Rf systemick-drupal-docker```

```docker-compose up --build```
