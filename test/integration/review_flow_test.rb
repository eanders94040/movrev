require 'test_helper'

class ReviewFlowTest < ActionDispatch::IntegrationTest
  test "can create a review" do

    # get the movie fixture
    jack1 = movies(:jack1)

    # go to 'leave a review page'
    get "/movies/" + jack1.id.to_s
    assert_response :success

    # count number of reviews
    num_reviews_before = Review.all.count

    # create a review
    post "/movies/" + jack1.id.to_s + "/reviews/", params: { review: { email: "eanders94040@gmail.com", date: "2017-09-25", rating: 5, comment: "loved it" } }
    assert_response :redirect
    follow_redirect!
    assert_response :success

    num_reviews_after = Review.all.count

    assert_equal num_reviews_after, num_reviews_before + 1, "Should be one more review after creation"
  end

end
