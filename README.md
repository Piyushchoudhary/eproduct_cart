## E-Product Cart

The objective of this project is to develop a general purpose e-commerce store
where any e-product (such as pdf, docs, csv, ppt etc.) can be bought from the comfort of home through the Internet.

However, for implementation purposes, this paper will deal with an online e-commerce store.
An online store is a virtual store on the Internet where customers can browse the
catalog and select products of interest. The selected items may be collected in a shopping
cart. At checkout time, the items in the shopping cart will be presented as an order. At
that time, user need to verify by using Twillio Authy for 2-factor authentication. An e-mail is
sent to the customer as soon as the order is placed with e-product as attachment.

## Live Application
https://fierce-depths-51967.herokuapp.com/
You can access admin section by using credentials:
```sh
username: eproduct2017@gmail.com
password: eproduct2017test
```

## System dependencies
* Ruby version: 2.3.0
* Rails version: 5.0.0
* psql (PostgreSQL) 9.6.1
* ImageMagick(https://www.imagemagick.org)
* Authy API key(https://www.twilio.com/)

## Installation

Make sure you have [Ruby](https://www.ruby-lang.org), PostgreSQL, ImageMagick and [Bundler](http://bundler.io)

```sh
git clone https://github.com/sandeep-patle/eproduct_cart.git
cd eproduct_cart
bundle
```

Setup database details in config/database.yml file and set admin login details into db/seeds.rb. Then continue with following commands:
```sh
rake db:create
rake db:migrate
rake db:seed
```

Configure config/sunspot.yml if you want to change default setting.
Start the packaged Solr distribution with:
```sh
bundle exec rake sunspot:solr:start # or sunspot:solr:run to start in foreground
```

Setup authy key and url in config/initializers/authy.rb:
```sh
Authy.api_key = '<authy_key>'
Authy.api_uri = '<authy_url>'
```

We are using gmail account to send emails. Setup username and password into config/secret.yml. Change SMTP setting if you want to use other service to send emails:
```sh
mail_username: <user_name>
mail_password: <password>
```

Start your rails server. That's it! Enjoy your new Rails application!.
Open http://locahost:3000

If you are using default admin credentials then can login into admin section using:
```sh
username: eproduct2017@gmail.com
password: eproduct2017test
```

Note: To stop and reindex sunspot solr using:
```sh
bundle exec rake sunspot:solr:stop
bundle exec rake sunspot:reindex
```

## How to run the test suite:
```sh
bundle exec rspec
```

## Setup Authy mobile application(Android/iOS):
* User need to setup Authy app in mobile by using mobile number which he used to register in this application.
* Checkout process will generate a Time based One Time Password using the Authy app and user need to use this token to verify checkout to place the order.
