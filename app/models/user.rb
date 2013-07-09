class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :firstname, :lastname, :link, :gender
  # attr_accessible :title, :body

  has_many :subjects
  has_many :advices

  def fullname
    "#{firstname} #{lastname}"
  end

  def role?(role)
    return !!self.roles.find_by_name(role.to_s.camelize)
  end
end
