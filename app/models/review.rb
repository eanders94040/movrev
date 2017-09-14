class Review < ApplicationRecord
  belongs_to :movie
  validates :email, presence: true,
                    length: { minimum: 5 }
end
