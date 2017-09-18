class Movie < ApplicationRecord
  has_many :reviews

  #def self.get_by_external_id_or_create(movie_json)
    #movie = Movie.find(:external_id => external_id)
    #if movie
    #  return movie
    #else
      
    #end
  #end
end
