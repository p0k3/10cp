class Advice < ActiveRecord::Base
  attr_accessible :title, :description, :subject, :user_id

  belongs_to :subject
  belongs_to :user
  accepts_nested_attributes_for :subject

  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

end