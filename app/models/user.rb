class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
                  :firstname, :lastname, :link, :gender, :avatar,
                  :birthdate, :website
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
