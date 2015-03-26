class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # attr_accessible :title, :body
  has_attached_file :avatar, :styles => {
                            :normal => "150x150#"
                          }
  has_many :subjects
  has_many :advices

  validates :firstname, :lastname, presence: true

  def fullname
    "#{firstname} #{lastname}"
  end

  def advices_count
    self.advices.count
  end
  def subjects_count
    self.subjects.count
  end

  def is_admin?
    type == "Admin"
  end

  def self.best_advisors
    select('users.*, COUNT(advices.id) AS notoriety')
      .joins('LEFT JOIN advices AS advices ON advices.user_id=users.id')
      .group('users.id')
      .order('notoriety DESC')
      .first(4)
  end
end
