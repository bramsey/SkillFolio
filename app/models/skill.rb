class Skill < ActiveRecord::Base
  #attr_accessible :name
  
  belongs_to :area
  has_many :levels, :dependent => :destroy
  accepts_nested_attributes_for :levels, 
                                :reject_if => lambda { |a| a[:description].blank? }, 
                                :allow_destroy => true
  
  validates :name, :presence => true
end
