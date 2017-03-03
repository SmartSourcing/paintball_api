class Phase < ActiveRecord::Base
  # == Associations
  belongs_to :tournament
  has_many :tournament_phases

  # == Validations
  validates :name, :tournament_id, presence: true

  #== Constants
  PHASES = [
      ['models.phase.final',1],
      ['models.phase.semifinal',2],
      ['models.phase.third',3],
      ['models.phase.quarterf',4],
      ['models.phase.knockout',5],
      ['models.phase.general',6]
  ]
end
