# Notational Momentum

Notational Momentum is a web-based note taking tool inspired by Notational
Velocity.

## Installation

```bash
$ git clone git@github.com:YOUR_FORK/notational_momentum.git
$ cd notational_momentum
$ bundle
$ cp config/database.example.yml config/database.yml
$ $EDITOR config/database.yml
$ rake db:create
$ rails s
```
## System Dependencies
* A database supported by ActiveRecord (developed on PostgreSQL)
* Ruby 1.9.2+
