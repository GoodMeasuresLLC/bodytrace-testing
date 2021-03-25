# Bodytrace Test App

## CODE Application:

config/bodytrace.yml
* Has post URL for ordering
* Has Kit Identifier for scale
* Has Kit Identifier for bp_cuff

Bodytrace_request.rb makes an order
models/bodytrace/request.rb
* Does a post to the fulfillment_url for a new order

In config/bodytrace.yml:
```
    staging: &staging
     <<: *defaults
      fulfillment_link: 'https://device-testing.herokuapp.com/api/orders'
      kit_id: 97dd7c56-5b44-11e4-9f3a-bc764e04e32e
      bp_cuff_kit_id: 2a72cb22-bf8d-11ea-9506-aa0000d39f2e
```

Staging is pre-configured to point to this test app for all bodytrace requests


What does the service send back:
* Bodytrace::OrdersController specifies what we expect when we order a scale
* Bodytrace::Request specifies more exactly what the post action is for ordering the scale/bp-cuff
* Bodytrace::MeasurementsController what happens when a member usings a scale

## Flow is:

* Test service receives order requests, creates an Scale or BpCuff
* Test service lists all devices and status: new, shipping. Ready.
* New devices can be shipped and become shipping
* Shipping Devices get delivered and become Ready
* Ready devices can have a reading entered.

When new devices are shipped, they post to our Bodytrace::OrdersController
New readings post to our Bodytrace::MeasurementsController


## To Run:

* Initialize your database by running `rake db:create`
* Run `bundle install`
* Run `yarn install`
* Run `rails server`
* In a new tab, run `yarn run dev`

## Production:
Test app http://device-testing.herokuapp.com/orders
Code for test app: https://github.com/GoodMeasuresLLC/bodytrace-testing
Deploy via heroku, I think the standard setup guide is:
https://devcenter.heroku.com/articles/getting-started-with-rails5#deploy-your-application-to-heroku
This should be deployed to Rob’s heroku account (or Good Measures? I can’t remember which)
The github repo is already linked with heroku such that if heroku is authenticated in the CLI, `git push heroku master` should deploy the app

## How it works:

The app has two pages: Orders, and Devices

  Orders show order requests, you can imitate Bodytrace’s response that it has shipped by clicking “ship” and then, after, imitate the delivery by clicking “deliver”

  Shipped and Delivered devices will appear on the Devices page, and from there you can enter readings for the device which imitates the data sent to us from bodytrace when a user takes a reading

If the list gets too long and confusing, just nuke the heroku app’s DB, via

```
  heroku run --app device-testing rake db:drop db:create db:migrate
```
