# EmailValidator from http://guides.rubyonrails.org/active_record_validations.html
class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
      record.errors[attribute] << (options[:message] || "is not an email")
    end
  end
end


class Review < ApplicationRecord
  belongs_to :movie
  validates :email, presence: true, email: true
  validates :date, presence: true
  validates :rating, presence: true
end



