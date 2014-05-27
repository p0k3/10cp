class Theme < ActiveRecord::Base
  attr_accessible :description, :title, :color, :icon

  has_attached_file :icon, :styles => {
                              :normal => "58x58"
                            }

  validates :color, presence: true
  validates :color, format: /#[A-F0-9]*/, allow_blank: true
  validates :description, presence: true
  validates :title, presence: true
  validates_attachment_content_type :icon, :content_type => %w(image/jpeg image/jpg image/png)

  has_many :subjects
end
