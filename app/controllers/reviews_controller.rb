class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    print 'wed got here'
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.create(review_params)
    #redirect_to movie_path(@movie)
    redirect_to movie_path(@movie, notice: 'success')
  end

  #def update
  #  @review = Review.find(params[:id])
 
  #  if @review.update(review_params)
  #    redirect_to @review
  #  else
  #    render 'edit'
  #  end
  #end

  #def destroy
  #  @review = Review.find(params[:id])
  #  @review.destroy
 
  #  redirect_to reviews_path
  #end

  private
    def review_params
      params.require(:review).permit(:email, :comment, :review_date, :rating)
    end

end
