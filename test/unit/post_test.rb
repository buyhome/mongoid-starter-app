require 'test_helper'

class PostTest < ActiveSupport::TestCase

  #
  # tests that machinist_mongo creates and saves a valid Post mongoDB document
  #
  test "valid MongoDB document created with Machinist" do
    assert_difference('Post.count') do
      Post.make
    end
  end

  #
  # tests "embeds_many :tags" association in Post model
  #
  test "valid Post with random associated Tags" do
    total = rand(100)
    post  = make_post_with_associations(total)
    assert post.tags.count == total
  end

  #
  # tests "embeds_many :comments" association in Post model
  #
  test "valid Post with random associated Comments" do
    total = rand(100)
    post  = make_post_with_associations(total)
    assert post.comments.count == total
  end

end
