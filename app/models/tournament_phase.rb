class TournamentPhase < ActiveRecord::Base
  # == Associations
  belongs_to :tournament
  belongs_to :tournament_date
  belongs_to :category
  belongs_to :phase

  # == Validations
  validates :tournament_id, :tournament_date_id, :category_id, :phase_id, presence: true
end
