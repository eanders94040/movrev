class WelcomeController < ApplicationController
  def index
    @recent_reviews = get_recent_reviews()
  end

  def create
    api_results = ModelForMyApi.retrieve_results(params[:title])

    @movies = []
    if api_results
      api_results['results'].each do |api_result|
	movie = get_by_external_id_or_create(api_result)
	@movies.push(movie)
      end
    end

    # sort here
    if params[:sort_by] == "Title"
      @movies = @movies.sort do |m1,m2| m1.title <=> m2.title end
    elsif params[:sort_by] == "Release Date"
      @movies = @movies.sort do |m1,m2| m1.release_date <=> m2.release_date end
    elsif params[:sort_by] == "Genre"
      @movies = @movies.sort do |m1,m2| 
        if m1.genre.nil? then 1
	elsif m2.genre.nil? then -1
	else m1.genre <=> m2.genre end
      end
    end

    respond_to do |format|
      format.js { }
    end
  end

  private
    def get_by_external_id_or_create(json)
      movies_in_db = Movie.where("external_id = ?", json['id'])
      if movies_in_db.empty?
        return Movie.create(:title => json['title'], :image => json['poster_path'], :genre => json['genre_ids'][0], :external_id => json['id'], :release_date => json['release_date'])
      else
        # should just be one, due to model validation, but take first result if not
        movies_in_db.each do |movie|
	  return movie
        end
      end
    end

    def get_recent_reviews()
      recent_reviews = Review.order(created_at: :desc).limit(5)
    end

end
