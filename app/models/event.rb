class Event < Post
  field :title
  field :location
  field :starts_at, :type => Date
  field :finishes_at, :type => Date

  validates_presence_of :title, :location, :starts_at, :finishes_at
end
