class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
          :recoverable, :rememberable,
          :trackable, :validatable, :omniauth_providers => [:facebook]

  include Gravtastic
  gravtastic

  # attr_accessible :title, :body
  has_attached_file :avatar, :styles => {
                            :normal => "150x150#"
                          },
                          url: "/system/users/:attachment/:id_partition/:style/:basename.:extension"
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

  def get_avatar
    if self.avatar.blank?
      self.gravatar_url
    else
      self.avatar.url
    end
  end

  def self.koala(auth)
    access_token = auth['token']
    facebook = Koala::Facebook::API.new(access_token)
    facebook.get_object("me?fields=name,picture")
  end

  def self.from_omniauth(auth)
    user = where(email: auth.info.email).first
    if user
      user.facebook_id = auth.uid
      user.facebook_token = auth[:credentials][:token]
    else
      user = User.new
      user.firstname = auth.info.first_name
      user.lastname = auth.info.last_name
      password = Devise.friendly_token[0,20]
      user.password = password
      user.password_confirmation = password
      user.email = auth.info.email
      user.facebook_id = auth.uid
    end
    user.save
    user
  end

end
