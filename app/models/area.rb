class Area < ActiveRecord::Base
  attr_accessible :name
  
  belongs_to :domain
  has_many :skills, :dependent => :destroy
  
  validates :name, :presence => true
end
