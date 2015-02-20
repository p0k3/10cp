class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :advice
  attr_accessible :is_good, :user_id, :advice_id, :ip


  validates_inclusion_of :is_good, :in => [true, false]
  validates :user_id, :advice_id, presence: true

  scope :is_good, -> {where(is_good: true)}
  scope :is_bad, -> {where(is_good: false)}
end
