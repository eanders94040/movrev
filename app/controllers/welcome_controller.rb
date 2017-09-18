class WelcomeController < ApplicationController
  def index
    if params[:ids]
      @movies = []
      ids = params[:ids].split(',')
      ids.each do |movie_id|
        @movies.push(Movie.find(movie_id))
      end
    end
  end

  def create
    api_results = ModelForMyApi.retrieve_results(params[:email])
    movie_ids = []
    if api_results
      api_results['results'].each do |api_result|
	movie = get_by_external_id_or_create(api_result)
	movie_ids.push(movie.id)
      end
    end

    redirect_to '/welcome/index?ids=' + movie_ids.join(",")
  end

  private
    def get_by_external_id_or_create(json)
      movies_in_db = Movie.where("external_id = ?", json['id'])
      if movies_in_db.empty?
        #print 'empty'
        return Movie.create(:title => json['title'], :image => json['poster_path'], :genre => json['genre_ids'], :external_id => json['id'], :release_date => json['release_date'])
      else
        #print 'not empty'
        # should just be one, but take first result if not (todo: ensure just one by db uniqueness constraint)
        movies_in_db.each do |movie|
	  #print movie.title
	  return movie
        end
      end
    end

end
