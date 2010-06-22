require 'test_helper'

class PostTest < ActiveSupport::TestCase

  test "valid MongoDB document created with Machinist" do
    assert_difference('Post.count') do
      Post.make
    end
  end

  #
  # tests "embeds_many :comments" association
  #
  test "valid Post with random associated Comments" do
    total = rand(100)
    post  = make_post_with_associations(total)
    assert_equal post.comments.count, total
  end

  #
  # tests Mongoid::Taggable plugin's tag support
  #
  test "tag list support by Mongoid Taggable plugin" do
    post = Post.make
    assert_equal post.tags_array.count, 4
  end

end
