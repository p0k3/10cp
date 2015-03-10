class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :advice
  attr_accessible :is_good, :user_id, :advice_id, :ip


  validates_inclusion_of :is_good, :in => [true, false]
  validates :advice_id, presence: true
  validate :has_a_user_or_an_ip?

  scope :is_good, -> {where(is_good: true)}
  scope :is_bad, -> {where(is_good: false)}

  def has_a_user_or_an_ip?
    if self.user.blank? && self.ip.blank?
      errors.add(:vote, 'doit avoir un utilisateur')
    end
  end

end
