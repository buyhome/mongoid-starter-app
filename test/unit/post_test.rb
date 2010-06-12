require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test "creates a valid test MongoDB document using Machinist/Mongoid setup" do
    assert_difference('Post.count') do
      Post.make
    end
  end

end
