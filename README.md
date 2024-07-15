# Technical test by Florent Gonon for Potloc

Hello and thank you for your time to checkout my exercice.
Here is our API to populate, update and get data from the database.

### Different features implemented
* An API to :
    * GET all the inventories
    * GET all stores
    * GET all inventories for given store
    * PUT Update an inventory for a given shoe and store


### Technical stack :
* ruby 3.1.2
* Rails 7.0.8.4
* PostgreSQL database


### Instructions
**When you're ready : You need yo launch the API server first to enable the inventory persistence in database**

* Make sure you have a complete installation of Ruby on Rails with depencies
* Make sure you have PostgreSQL to allow to create a Database
* `rails db:create && rails db:migrate && rails db:seed` to create, migrate and seed the Database
* `bundle install`
* Then launch the following command : `rails s`



### Test
I used RSpec to wrote the tests. For launch the test, just run `bundle exec rspec`


# Last words
I'm honored to have make this exercice for Potloc, and hope you enjoy to read and test it as much as I have take pleasure to make it. Enjoy !