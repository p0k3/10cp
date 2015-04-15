class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
          :recoverable, :rememberable,
          :trackable, :validatable

  include Gravtastic
  gravtastic

  # attr_accessible :title, :body
  has_attached_file :avatar, :styles => {
                            :normal => "150x150#"
                          },
                          url: "/system/users/:attachment/:id_partition/:style/:basename.:extension"
  has_many :subjects
  has_many :advices
  has_many :authentications, :dependent => :delete_all

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
    self.avatar.url
  end

  def apply_omniauth(auth)
    # In previous omniauth, 'user_info' was used in place of 'raw_info'
    self.email = auth['extra']['raw_info']['email']
    self.firstname = auth['extra']['raw_info']['first_name']
    self.lastname = auth['extra']['raw_info']['last_name']
    # Again, saving token is optional. If you haven't created the column in authentications table, this will fail
    authentications.build(:provider => auth['provider'], :uid => auth['uid'], :token => auth['credentials']['token'])
  end


end
