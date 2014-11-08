class Theme < ActiveRecord::Base
  attr_accessible :description, :title, :color, :icon

  has_attached_file :icon, :styles => {
                              :normal => "58x58"
                            }

  validates :color, presence: true
  validates :color, format: /#[A-F0-9]*/, allow_blank: true
  validates :description, presence: true
  validates :title, presence: true
  validates_attachment_presence :icon



  has_many :subjects
  has_many :themes
  belongs_to :theme

  scope :masters, -> {where(theme_id: nil)}
end
