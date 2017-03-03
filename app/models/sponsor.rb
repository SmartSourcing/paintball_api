class Sponsor < ActiveRecord::Base

  # == Validations
  validates :name, :logo,  presence: true

  # == Associations
  has_and_belongs_to_many :tournament_dates

  # == Uploaders
  mount_uploader :logo, LogoSponsorUploader
end
