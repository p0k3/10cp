class Theme < ActiveRecord::Base
  attr_accessible :description, :title, :color

  validates :color, presence: true
  validates :color, format: /#[A-F0-9]*/, allow_blank: true
  validates :description, presence: true
  validates :title, presence: true

  has_many :subjects
end
