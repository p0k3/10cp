class Advice < ActiveRecord::Base

  belongs_to :subject
  belongs_to :user
  has_many :votes
  accepts_nested_attributes_for :subject

  validates :title, presence: true
  validates :description, presence: true
  validates :user_id, presence: true

  state_machine :state, :initial => :suggested do

    event :validate do
      transition :suggested => :validated
    end

    event :invalidate do
      transition :suggested => :disabled
    end

  end

  scope :validated, -> {where(state: :validated)}

  def upvotes
    self.votes.is_good.count
  end

  def downvotes
    self.votes.is_bad.count
  end

  def has_already_vote(user, ip)
    if !user.blank?
      Vote.where(user_id: user.id, advice_id: self.id).any?
    else
      Vote.where(ip: ip, advice_id: self.id).any?
    end
  end

  def self.order_by_notoriety
    select('advices.*, COUNT(upvotes.id) - COUNT(downvotes.id) AS notoriety')
      .joins('LEFT JOIN votes AS upvotes ON upvotes.advice_id=advices.id AND upvotes.is_good=1')
      .joins('LEFT JOIN votes AS downvotes ON downvotes.advice_id=advices.id AND upvotes.is_good=0')
      .group('advices.id')
      .order('notoriety DESC')
  end

  def subject_title
    self.subject.title
  end
  def theme_title
    self.subject.theme_title
  end

end