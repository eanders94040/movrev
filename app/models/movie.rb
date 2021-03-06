class Movie < ApplicationRecord
  has_many :reviews

  validates :external_id, uniqueness: true, on: :create

  enum genre: {action: 28, adventure: 12, animation: 16, comedy: 35, crime: 80, documentary: 99, drama: 18, 
    family: 10751, fantasy: 14, history: 36, horror: 27, music: 10402, mystery: 9648, romance: 10749, 
    science_fiction: 878, tv_movie: 10770, thriller: 53, war: 10752, western: 37, foreign: 10769}

  def average_rating
    if self.reviews.size > 0
      self.reviews.average(:rating).round  # todo: partial stars
    else
      nil
    end
  end

end
