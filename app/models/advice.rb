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

    state :disabled do
      validates :invalidation_reason, presence: true
    end

    after_transition :on => :validate, :do => :send_confirmation_validation
    # after_transition :on => :validate, :do => :post_on_facebook
    after_transition :on => :invalidate, :do => :send_confirmation_invalidation

  end

  scope :validated, -> {where(state: :validated)}
  scope :invalidated, -> {where(state: :disabled)}

  def send_confirmation_validation
    AdviceMailer.send_confirmation_validation(self).deliver
  end
  def send_confirmation_invalidation
    AdviceMailer.send_confirmation_invalidation(self).deliver
  end

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

  def user_email
    if self.has_user?
      self.user.email
    elsif !self.author_email.blank?
      self.author_email
    else
      "p.gruson@gmail.com"
    end
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

  def post_on_facebook
    # facebook = Koala::Facebook::API.new(self.user.facebook_token)
    # facebook.put_wall_post("J'ai publié un nouveau conseil sur 10ConseilsPour<br>#{self.title}<br>Pour en savoir plus ! #{Rails.application.routes.url_helpers.subject_url(self.subject_slug, self.subject_id, host: '10conseilspour.fr')}")
  end

end