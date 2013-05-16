class Subject < ActiveRecord::Base
  attr_accessible :title, :description

  has_many :advices

  validates :title, presence: true
  validates :description, presence: true
end
