class Player < ActiveRecord::Base

  # == Associations
  belongs_to :roster
  has_and_belongs_to_many :gears

  # == Validations
  validates :firstname, :lastname, :nickname, :nationality, presence: true
  validates :passport, numericality: { only_integer: true }

  # == Uploaders
  mount_uploader :logo, LogoPlayerUploader

  # == Public instance methods
  def full_name
    [firstname, lastname].join ' '
  end

  def logo_size
    if logo.present? && logo.file.size.to_f/(1000*1000) > 0.5
      errors.add(:logo, "You cannot upload a file greater than 0.5MB")
    end
  end
end
