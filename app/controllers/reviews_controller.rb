class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  #def show
  #  @review = Review.find(params[:id])
  #end

  #def new
  #  @review = Review.new
  #end

  def create
    movie = Movie.find(params[:movie_id])
    review = movie.reviews.create(review_params)
    #redirect_to movie_path(@movie)

    if review.save
      flash[:success] = "Thanks for creating a review!"
      #redirect_to movie_path(movie, notice: 'success')
      redirect_to movie_path(movie)
    else
      #print review.errors.messages
      flash[:error] = review.errors.messages
      #redirect_to movie_path(movie, notice: 'error')
      redirect_to movie_path(movie)
    end
  end

  private
    def review_params
      params.require(:review).permit(:email, :comment, :date, :rating)
    end

end
