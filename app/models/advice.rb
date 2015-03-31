class Advice < ActiveRecord::Base
  require 'digest/md5'

  belongs_to :subject
  belongs_to :user
  has_many :votes

  validates :title, presence: true
  validates :description, presence: true
  validates :author_name, :author_email, presence: true, unless: :has_user?
  validates :subject, presence: true

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
  def subject_slug
    self.subject.slug
  end
  def theme_title
    self.subject.theme_title
  end
  def theme_color
    self.subject.theme_color
  end

  def has_user?
    !self.user_id.blank?
  end

  def user_avatar
    if self.has_user?
      self.user.get_avatar
    else
      hash = Digest::MD5.hexdigest(self.author_email)
      "http://www.gravatar.com/avatar/#{hash}"
    end
  end

  def authorname
    if self.has_user?
      self.user.fullname
    else
      self.author_name
    end
  end

  def user_website
    if self.has_user?
      self.user.website unless self.user.website.blank?
    else
      self.author_website unless self.author_website.blank?
    end
  end

end