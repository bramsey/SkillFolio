class Domain < ActiveRecord::Base
  attr_accessible :name
  
  belongs_to :user
  has_many :areas, :dependent => :destroy
  
  validates :name, :presence => true
end
