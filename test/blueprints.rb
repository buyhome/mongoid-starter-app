require 'machinist/mongoid'
require 'sham'
require 'faker'

Sham.owner { Faker::Name.name }

Post.blueprint do
  owner { Sham.owner }
  published_on Date.today
end
