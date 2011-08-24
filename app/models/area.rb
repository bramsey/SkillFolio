class Area < ActiveRecord::Base
  attr_accessible :name
  
  belongs_to :domain
  
  validates :name, :presence => true
end
