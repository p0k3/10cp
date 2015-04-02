class Subject < ActiveRecord::Base

  has_attached_file :illustration, :styles => {
                            :normal => "980x600>",
                            :thumb => "440x240#"
                          }
  has_many :advices
  belongs_to :theme
  belongs_to :user
  accepts_nested_attributes_for :advices

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

  end
  scope :validated, -> {where(state: :validated)}

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
