require 'test_helper'

class EventTest < ActiveSupport::TestCase

  test "inherited attributes from Post model" do
    e = Event.make
    assert_nil e.position
    assert_not_nil e.owner
    assert_not_nil e.published_on
  end

end
