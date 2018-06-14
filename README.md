# Drupal projects for Systemick

## Usage

TO CREATE A NEW PROJECT:

First you need to [install Docker](https://docker-curriculum.com/).

Then you need to [install composer](https://getcomposer.org/doc/00-intro.md#installation-linux-unix-osx).

Finally [install the latest version of drush](http://docs.drush.org/en/master/install/).

You don't have to install Drupal using composer but the community is moving to that method (Drush 9 requires a site to be built with composer) so it might be an idea to give it a try.

cd to working directory eg /home/projects or /var/www/html

```composer create-project drupal-composer/drupal-project:8.x-dev [myproject] --stability dev --no-interaction```

```cd [myproject]```

```git clone https://github.com/systemick3/systemick-drupal-docker.git```

```mv systemick-drupal-docker/.docker .```

```mv systemick-drupal-docker/docker-compose.yml .```

```rm -Rf systemick-drupal-docker```

Edit the file docker-compose.yml so that the line '- /Users/mike/.composer:/root/.composer' points to your own composer directory
In other words change '/Users/mike/.composer' to something like '/home/[myusername]/.composer

To build the project (Takes around 10 mins the first time)
```docker-compose up --build```

To exit the terminal press Ctrl-C (this will bring down your dev site) - running ```docker build -d``` will run Docker as abackground process freeing up your terminal for other commands.

To run the project once it is built:
```docker-compose up -d``` this will run Docker as a background process freeing up your terminal for other commands. 
It is sometimes useful to omit the -d option as this outputs the apache log in the terminal.

There are 3 Docker instances running: one for the web app, one for mysql and one for redis. You can see them by running the command ```docker ps```.

To log into the app instance
```docker-compose exec app /bin/bash```
This is the equivalent of ssh-ing into your docker instance.
The Drupal code lives in the directory /srv/app/web. If you cd to this directory you can run drush commands.

To open a mysql client on the mysql instance
```mysql -u root -P 13306 -h 127.0.0.1 -p```

To install Drupal:
navigate to http://localhost:8080/
When asked for the database settings enter app for the user, letmein for the password, drupal as the database, mysql as the host and 3306 as the port.
You can change the above settings by editing docker-compose.yml before your inital build.

Use your favourite editor on your host machine to edit the Drupal code.
