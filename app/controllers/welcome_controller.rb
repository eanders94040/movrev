class WelcomeController < ApplicationController
  def index
    #if params[:ids]
    #  @movies = []
    #  ids = params[:ids].split(',')
    #  ids.each do |movie_id|
    #    @movies.push(Movie.find(movie_id))
    #  end
    #end

    # get recent reviews
    #@recent_reviews = get_recent_reviews()
  end

  def create
    print 'got here'
    api_results = ModelForMyApi.retrieve_results(params[:email])
    movie_ids = []
    @movies = []
    if api_results
      print 'a'
      api_results['results'].each do |api_result|
        print 'b'
	movie = get_by_external_id_or_create(api_result)
	@movie = movie  # just trying to get something to show
	@movies.push(movie)
	movie_ids.push(movie.id)
      end
    end

    respond_to do |format|
      format.js { }
    end

    # trying to get ajax to work
    #redirect_to '/welcome/index?ids=' + movie_ids.join(",")
  end

  private
    def get_by_external_id_or_create(json)
      movies_in_db = Movie.where("external_id = ?", json['id'])
      if movies_in_db.empty?
        return Movie.create(:title => json['title'], :image => json['poster_path'], :genre => json['genre_ids'], :external_id => json['id'], :release_date => json['release_date'])
      else
        # should just be one, but take first result if not (todo: ensure just one by db uniqueness constraint)
        movies_in_db.each do |movie|
	  return movie
        end
      end
    end

    #def get_recent_reviews()
      #recent_reviews = []
      
    #end

end
