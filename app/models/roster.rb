class Roster < ActiveRecord::Base

  # == Associations
  has_many :tournament_date
  has_many :players
end
