class Theme < ActiveRecord::Base

  has_attached_file :icon, :styles => {
                              :normal => "58x58"
                            }

  validates :color, presence: true
  validates :color, format: /#[A-F0-9]*/, allow_blank: true
  validates :description, presence: true
  validates :title, presence: true
  validates :slug, presence: true
  validates_attachment_presence :icon

  has_many :subjects
  has_many :themes
  belongs_to :theme

  after_create :set_slug

  scope :masters, -> {where(theme_id: nil)}

  def set_slug
    self.slug = self.title.to_slug
  end

  def subjects_count
    self.subjects.count
  end

end
