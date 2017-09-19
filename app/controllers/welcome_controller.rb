class WelcomeController < ApplicationController
  #require 'rest-client'

  def index
    # get recent reviews
    #@recent_reviews = get_recent_reviews()
  end

  def create
    #print 'got here'
    api_results = ModelForMyApi.retrieve_results(params[:email])

    @movies = []
    if api_results
      api_results['results'].each do |api_result|
	movie = get_by_external_id_or_create(api_result)
	@movies.push(movie)
      end
    end

    #print @movies

    # sort here
    if params[:submit] == "Sort By Title"
      #print "sort by title"
      @movies = @movies.sort do |m1,m2| m1.title <=> m2.title end
    elsif params[:submit] == "Sort By Release Date"
      @movies = @movies.sort do |m1,m2| m1.release_date <=> m2.release_date end
    #else
      #print "dont sort"
    end

    respond_to do |format|
      format.js { }
    end
  end

  private
    def get_by_external_id_or_create(json)
      movies_in_db = Movie.where("external_id = ?", json['id'])
      if movies_in_db.empty?
        #genre = get_first_genre(json)
        #return Movie.create(:title => json['title'], :image => json['poster_path'], :genre => json['genre_ids'], :external_id => json['id'], :release_date => json['release_date'])
        #return Movie.create(:title => json['title'], :image => json['poster_path'], :genre => genre, :external_id => json['id'], :release_date => json['release_date'])
        return Movie.create(:title => json['title'], :image => json['poster_path'], :genre => json['genre_ids'][0], :external_id => json['id'], :release_date => json['release_date'])
      else
        # should just be one, but take first result if not (todo: ensure just one by db uniqueness constraint)
        movies_in_db.each do |movie|
	  return movie
        end
      end
    end

    #def get_first_genre(json)
      #print json
      #print 'got here\n'
      #print json['genre_ids']
      #print json['genre_ids'].class
      #return json['genre_ids'][0]
      #genre_arr_json = JSON.parse(json['genre_ids'])  # now i have a json array
      #print 'after parse'
      #genre = genre_arr_json[0]
      #print genre
      #return genre

      #genre_arr = json['genre_ids'].split(",")
      #print 'a\n'
      #print genre_arr
      #genre = genre_arr[0]
      #print 'b\n' 
      #print genre
      #return genre
    #end

    #def sort_by_movie_title = ->(m1, m2)
    #  { m1.title <=> m2.title }

    #def get_recent_reviews()
      #recent_reviews = []
      
    #end

end
