class Vote < ActiveRecord::Base
  belongs_to :user
  belongs_to :advice


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

  def advice_title
    self.advice.title
  end

  def user_fullname
    self.user.fullname unless self.user.blank?
  end

end
