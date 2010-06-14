class Tag
  include Mongoid::Document
  field :name
  field :title
  embedded_in :post, :inverse_of => :tags

  validates_presence_of :name, :title
end
