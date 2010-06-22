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
    assert_not_nil event.tags
    assert_not_nil event.published_on
  end

  #
  # tests "embeds_many :comments" intherited association from Post model
  #
  test "random comments from inherited association" do
    total = rand(100)
    event = make_event_with_associations(total)
    assert_equal event.comments.count, total
  end

  #
  # tests Mongoid::Taggable plugin inherited from Post model
  #
  test "tag list from inherited tag support" do
    event = Event.make
    assert_equal event.tags_array.count, 4
  end

end
