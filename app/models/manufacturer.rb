class Manufacturer < ActiveRecord::Base

  # ==Relationships
  has_many :gear

  # == Validations
  validates :name, presence: true
end
