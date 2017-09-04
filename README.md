**README**

**Project Name: RECMAN**

![Build Status](https://travis-ci.org/paa-yaw/management_app.svg?branch=test)

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

**Ruby and Rails Versions**

* ruby 2.2.1p85

* Rails 4.2.5.1


**System Dependencies**

* check /Gemfile for gems/libraries to install

**App Configuration and Setup**

* NOTE: you must have the following installed:

* [ruby(2.2.1p85) installation here](https://www.ruby-lang.org/en/downloads/)

* [rails(4.2.5.1) installation here](http://railsinstaller.org/en)

* [how to setup rails with postgres here](https://www.digitalocean.com/community/tutorials/how-to-setup-ruby-on-rails-with-postgres) OR
[here](https://www.digitalocean.com/community/tutorials/how-to-use-postgresql-with-your-ruby-on-rails-application-on-ubuntu-14-04)

**Getting Started**

* run the following commands:

```
  mkdir app_dir

  cd app_dir

  git clone https://github.com/paa-yaw/management_app.git
  
  cd app_dir/management_app

  bundle install

  bin/rails s

```  

**Database initialization**

* NOTE: you must already have postgres setup with rails
* In your database.yml setup your username and password for development and production using environment variables like so:

```
  
development:
  <<: *default
  database: management_app_development
  username: <%= ENV['MANAGEMENT_APP_DATABASE_USERNAME'] %>
  password: <%= ENV['MANAGEMENT_APP_DATABASE_PASSWORD'] %>
  host: localhost

production:
  <<: *default
  database: management_app_production
  username: management_app
  password: <%= ENV['MANAGEMENT_APP_DATABASE_PASSWORD'] %>


```

 
* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


Please feel free to use a different markup language if you do not plan to run
<tt>rake doc:app</tt>.
