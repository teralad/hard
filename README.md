Hard
================

[![Deploy to Heroku](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy)

This application was generated with the [rails_apps_composer](https://github.com/RailsApps/rails_apps_composer) gem
provided by the [RailsApps Project](http://railsapps.github.io/).

Rails Composer is supported by developers who purchase our RailsApps tutorials.

Ruby on Rails
-------------

This application requires:

- Ruby 2.5.0
- Rails 5.1.6

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

Getting Started
---------------
Clone the project, run bundle install,
run rake db:create db:migrate db:seed for test and development.

Sign up.
Use the token from /users/#ID to send api requests.

Added GraphQL endpoint /graphql,

The auth for GraphQL is basic auth with Bearer token.
The following has to be added to headers to send the request.

I personally use graphql_playground / insomnia to work with GraphQL api's.
```
{
    "Authorization": "Bearer #{token}"
}
```