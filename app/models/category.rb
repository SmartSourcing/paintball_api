class Category < ActiveRecord::Base

  # == Validations
  validates :name,  presence: true
end
