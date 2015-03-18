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
  validates_attachment_content_type :illustration, :content_type => %w(image/jpeg image/jpg image/png image/gif)

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
    self.theme.color
  end

  def theme_title
    self.theme.title
  end
end
