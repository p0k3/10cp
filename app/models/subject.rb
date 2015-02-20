class Subject < ActiveRecord::Base
  attr_accessible :title, :description, :advice, :illustration, :theme_id, :theme

  has_attached_file :illustration, :styles => {
                            :normal => "980x600>",
                            :thumb => "220x120#"
                          }
  has_many :advices
  belongs_to :theme
  belongs_to :users
  accepts_nested_attributes_for :advices

  validates :title, presence: true
  validates :description, presence: true
  validates_attachment_content_type :illustration, :content_type => %w(image/jpeg image/jpg image/png image/gif)


  def theme_color
    self.theme.color
  end

end
