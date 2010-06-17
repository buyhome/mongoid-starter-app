class Post
  include Mongoid::Document
  include Mongoid::Taggable
  field :owner
  field :position
  field :published_on, :type => Date
  embeds_many :comments

  validates_presence_of :owner
end
