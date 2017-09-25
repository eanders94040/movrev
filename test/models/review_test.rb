require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "should not save review without email" do
    review = Review.new
    assert_not review.save
  end

  test "should not save review with invalid email" do
    bad_email = reviews(:bad_email)
    assert_not bad_email.save
  end

  test "should save review with valid email" do
    good_email = reviews(:good_email)
    assert good_email.save
  end
end
