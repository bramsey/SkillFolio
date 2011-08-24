class Skill < ActiveRecord::Base
  attr_accessible :name
  
  belongs_to :area
  has_many :levels, :dependent => :destroy
  
  validates :name, :presence => true
end
