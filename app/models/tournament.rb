class Tournament < ActiveRecord::Base

  # == Associations
  has_many :tournament_dates

  # == Scopes
  scope :active,  -> { where(active: true)  }
  scope :inactive,-> { where(active: false) }

  # == Uploaders
  mount_uploader :logo, LogoTournamentUploader

  # == Validations
  validates :name, :nickname, :started_at, :finished_at, :tournament_type, :country,  presence: true
end
