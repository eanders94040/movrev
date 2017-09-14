class Review < ApplicationRecord
  validates :email, presence: true,
                    length: { minimum: 5 }
end
