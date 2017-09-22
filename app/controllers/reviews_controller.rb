class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def create
    movie = Movie.find(params[:movie_id])
    review = movie.reviews.create(review_params)

    if review.save
      flash[:success] = true
      redirect_to movie_path(movie)
    else
      flash[:error] = review.errors.full_messages
      # todo: don't redirect on error
      redirect_to movie_path(movie)
    end
  end

  private
    def review_params
      params.require(:review).permit(:email, :comment, :date, :rating)
    end

end
