# CODE Application

config/bodytrace.yml
* Has post URL for ordering
* Has Kit Identifier for scale
* Has Kit Identifier for bp_cuff

Bodytrace_request.rb makes an order  
models/bodytrace/request.rb  
* Does a post to the fulfillment_url for a new order

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
* In a new tab, run `yarn run start`

## Production:
Test app http://bodytrace-testing.herokuapp.com/orders  
Code for test app: https://github.com/GoodMeasuresLLC/bodytrace-testing
