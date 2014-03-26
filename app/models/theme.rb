class Theme < ActiveRecord::Base
  attr_accessible :description, :title

  has_many :subjects
end
