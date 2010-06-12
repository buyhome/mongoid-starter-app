class Post
  include Mongoid::Document
  field :owner
  field :position
  field :published_on, :type => Date
  embeds_many :tags
  embeds_many :comments

  validates_presence_of :owner
end
