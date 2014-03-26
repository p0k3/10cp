class Subject < ActiveRecord::Base
  attr_accessible :title, :description, :advice

  has_many :advices
  belongs_to :theme
  belongs_to :users
  accepts_nested_attributes_for :advices

  validates :title, presence: true
  validates :description, presence: true
end
