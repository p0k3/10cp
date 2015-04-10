class Subject < ActiveRecord::Base

  has_attached_file :illustration, :styles => {
                            :normal => "980x600>",
                            :thumb => "440x240#"
                          }
  has_many :advices
  accepts_nested_attributes_for :advices, :reject_if => proc { |attributes| attributes['title'].blank? }, :allow_destroy => true
  belongs_to :theme
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :slug, presence: true
  validates :state, inclusion: { in: %w(suggested validated disabled)}
  validates_attachment_content_type :illustration, :content_type => %w(image/jpeg image/jpg image/png image/gif)

  before_validation :set_slug, on: :create

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
    after_transition :on => :invalidate, :do => :send_confirmation_invalidation

  end
  scope :validated, -> {where(state: :validated)}
  scope :invalidated, -> {where(state: :disabled)}

  def send_confirmation_validation
    SubjectMailer.send_confirmation_validation(self).deliver
  end
  def send_confirmation_invalidation
    SubjectMailer.send_confirmation_invalidation(self).deliver
  end

  def theme_color
    self.theme.color unless self.theme.blank?
  end

  def theme_title
    self.theme.title unless self.theme.blank?
  end
  def theme_slug
    self.theme.slug unless self.theme.blank?
  end
  def theme_id
    self.theme.id unless self.theme.blank?
  end

  def user_email
    self.user.email unless self.user.blank?
  end

  def authorname
    self.user.fullname unless self.user.blank?
  end

  def advices_count
    self.advices.count
  end

  def set_slug
    self.slug = self.title.to_slug
  end
end
