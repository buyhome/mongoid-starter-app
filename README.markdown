# Rails 2.3.5 sample application for testing MongoDB and Mongoid

So with all this No-SQL craze this is just for showing the basic reference setup guidelines for using MongoDB document-oriented database store and the Mongoid ODM (Object Document Mapper) in a Rails2 project.

## Install the latest MongoDB

http://www.mongodb.org/display/DOCS/Ubuntu+and+Debian+packages

(Warning: it's about 135 Mb of dependecies packages for Ubuntu 10.04 and MongoDB 1.4.3)

Alternatively, install MongoDB from sources. See guide at http://library.linode.com/databases/mongodb/ubuntu-10.04-lucid

## Install all the Gems required

Note that the Mongoid 1.9.0 gem explicitly requires ActiveSupport >= 2.2.2, so my current Rails stack was:

* actionmailer (2.3.5)
* actionpack (2.3.5)
* activerecord (2.3.5)
* activeresource (2.3.5)
* activesupport (2.3.5)
* bson (1.0.2)
* bson_ext (1.0.1)
* durran-validatable (2.0.1)
* faker (0.3.1)
* machinist (1.0.6)
* machinist_mongo (1.1.0)
* mongo (1.0.2)
* mongoid (1.9.0)
* rack (1.0.1)
* rails (2.3.5)
* rake (0.8.7)
* rdoc (2.5.8)
* will_paginate (2.3.14)

Except for machinist*, faker and bson_ext, all gems listed are dependecies for Rails and/or Mongoid.

Also, Mongoid 1.9.0 explicitly mentions support for MongoDB 1.4.0.

## Relevant files

Take your time to go thru this very important files for the MongoDB/Mongoid setup:

- config/environment.rb
- config/mongoid.yml
- config/initializers/mongo.rb
- app/models/post.rb
- app/models/comment.rb

## Testing the MongoDB database connection

MongoDB databases need not be explicitly created, since they're created lazily by the server. So first test that your MongoDB server is running and that the connection is stablished correctly from the Rails console:

    $ ./script/console
    Loading development environment (Rails 2.3.5)

    ruby-1.8.7-p249 > Post.all
     => #<Mongoid::Criteria:0xb72f66f8 @klass=Post, @selector={}, @options={}, @documents=[]>
    ruby-1.8.7-p249 > Comment.all
     => #<Mongoid::Criteria:0xb72bb4f4 @klass=Comment, @selector={}, @options={}, @documents=[]>

## Testing the document models with unit tests

Unit tests test proper MongoDB documents creation with Machinist and Mongoid models associations and inheritance. Also, the [mongoid-taggable][tag] plugin is tested on the Post and it's inherited Event model.

Just run them using:

    $ rake test:units

Relevant files:

- test/test_helper.rb
- test/blueprints.rb
- test/unit/post_test.rb
- test/unit/event_test.rb

[tag]: http://github.com/wilkerlucio/mongoid_taggable
