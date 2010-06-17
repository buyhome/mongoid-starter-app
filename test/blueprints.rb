# Machinist is so much better for creating fixtures for DataMapper, Sequel and ActiveRecord models
# the machinist_mongo gem adds support for MongoMapper and Mongoid (we'll use Mongoid)

require 'machinist/mongoid'
require 'sham'
require 'faker'

#
# add fake tag list support to Faker
#
module Faker
  class Lorem
    def self.tags(tag_count=3)
      words(tag_count).join(', ')
    end
  end
end

Sham.define do
  owner    { Faker::Name.name }
  name     { Faker::Lorem.words(1) }
  title    { Faker::Lorem.sentence }
  body     { Faker::Lorem.paragraphs }
  location { Faker::Lorem.words }
  tags     { Faker::Lorem.tags(4) }
end

Post.blueprint do
  owner  # looks for Sham.owner
  tags   # to populate tag list, as provided by Mongoid Taggable plugin
  published_on Date.today
end

Comment.blueprint do
  owner
  body
end

Event.blueprint do
  title
  location
  starts_at Date.today
  finishes_at Date.tomorrow
end
