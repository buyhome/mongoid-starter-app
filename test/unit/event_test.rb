require 'test_helper'

class EventTest < ActiveSupport::TestCase

  test "valid MongoDB document created with Machinist" do
    assert_difference('Event.count') do
      Event.make
    end
  end

  test "inherited attributes from Post model" do
    event = Event.make
    assert_nil event.position
    assert_not_nil event.owner
    assert_not_nil event.published_on
  end

  #
  # tests "embeds_many :tags" inherited association from Post model
  #
  test "random Tags from inherited association" do
    total = rand(100)
    event = make_event_with_associations(total)
    assert event.tags.count == total
  end

  #
  # tests "embeds_many :comments" intherited association from Post model
  #
  test "random Comments from inherited association" do
    total = rand(100)
    event = make_event_with_associations(total)
    assert event.comments.count == total
  end

end
