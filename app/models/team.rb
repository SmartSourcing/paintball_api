class Team < ActiveRecord::Base
  # == Associations
  belongs_to  :category
  has_many    :fixtures

  # == Validations
  validates :name, :country,  presence: true

  # == Uploaders
  mount_uploader :logo, LogoTeamUploader

  #= Gets the thumb version of the logo
  #
  def get_thumb
    (self.logo.present?)? self.logo.thumb : 'assets/logo.png'
  end
end
