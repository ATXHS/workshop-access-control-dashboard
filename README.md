# Workshop Access Control Dashboard

This is a web interface for managing the [cerberus-prox](https://github.com/dfraser/cerberus-prox) keycard system.

The two projects share a database and do not communicate directly.

**Warning: Database changes may break cerberus-prox!**

## Setup and Running

### Docker

The easiest way to get started is to run the project using [docker](https://www.docker.com/) and [docker-compose](https://docs.docker.com/compose/).

* `docker-compose up` to setup and run the project, including MySQL.
* To run in the background use `docker-compose up -d` instead.
* `docker-compose down` to stop if using `-d`.

#### Database

* To setup the database run the project then `docker-compose run web rake db:setup`.
* To import a SQL dump create the DB then use `docker-compose run db mysql -h db -u root workshop_access_control_dev < [SQL DUMP FILENAME]`

Note: The database is insecure with an empty root password. Be careful
opening it to other apps.

### Local

This project is built using Ruby on Rails. It is best to have rbenv or rvm
installed before trying to run this.

* Install required gems with `bundle`.
* Development server: `bundle exec rails server`.
