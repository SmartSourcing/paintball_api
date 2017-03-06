class Gear < ActiveRecord::Base

  # ==Relationships
  belongs_to :manufacturer
  has_and_belongs_to_many :players

  # == Validations
  validates :name, :category, :manufacturer, :year, presence: true

  CATEGORIES    = ['Marker', 'Shirt', 'Pant']
  MANUFACTURERS = ['Planet Eclipse', 'Bob Long', 'Dlx', 'Dye']

  scope :markers, ->  { where(category: 'Marker')  }
  scope :shirts,  ->  { where(category: 'Shirt')  }
  scope :pants,   ->  { where(category: 'Pant')  }

  def self.manufacturers

    items = []
    Gear::MANUFACTURERS.each_with_index { |a,i|

      items << [a,i]
    }
    items
  end
end
