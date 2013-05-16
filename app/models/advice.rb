class Advice < ActiveRecord::Base
  attr_accessible :title, :description

  belongs_to :subject

  validates :title, presence: true
  validates :description, presence: true

end