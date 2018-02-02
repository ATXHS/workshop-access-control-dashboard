# Workshop Access Control Dashboard

This is a web interface for managing the [cerberus-prox](https://github.com/dfraser/cerberus-prox) keycard system.

The two projects share a database and do not communicate directly.

**Warning: Database changes may break cerberus-prox!**

## Setup

This project is built using Ruby on Rails. It is best to have rbenv or rvm
installed before trying to run this.

* Install required gems with `bundle`
* Development server: `bundle exec rails server`
