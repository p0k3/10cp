class Advice < ActiveRecord::Base
  attr_accessible :title, :description, :subject

  belongs_to :subject
  accepts_nested_attributes_for :subject 

  validates :title, presence: true
  validates :description, presence: true

end