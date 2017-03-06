class TournamentDate < ActiveRecord::Base

  # == Associations
  belongs_to :tournament
  belongs_to :roster
  has_and_belongs_to_many :sponsors

  # == Validations
  validates :description, :active, :close_draw_at, :contact, :tournament_id, :started_at, :finished_at, presence: true
end
