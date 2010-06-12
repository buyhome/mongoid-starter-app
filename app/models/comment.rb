class Comment
  include Mongoid::Document
  include Mongoid::Timestamps
  field :owner
  field :body
  embedded_in :post, :inverse_of => :comments
end
