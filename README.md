# Basic Rails/Vue Site

This template is meant to provide you with a base website that uses Ruby on Rails as an API and Vue as a reactive front end. This setup is perfect for very quickly prototpying SPA web applications, leveraging the ease of bulding single file Vue components, fast styling with Bootstrap Vue, and quick API scaffolding with ActiveRecord.

## Included:

* [Bootstrap Vue](https://bootstrap-vue.js.org/) for ease of creating navigation, site grids, layouts, and more
* [Vue Generators](https://github.com/GoodMeasuresLLC/vue-generators) for easily scaffolding powerful single file Vue components, Vuex stores, and more
* [Devise](https://github.com/heartcombo/devise) for easy, straightforward authentication
* Preconfigured for PostgreSQL 11
* HAML syntax for rails view templates

## To Run:

* First, update the `config/database.yml` file and rename the databases to the title of your project
* Initialize your database by running `rake db:create`
* Run `bundle install`
* Run `yarn install`
* Run `rails server`
* In a new tab, run `yarn run start`
