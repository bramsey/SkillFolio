class Skill < ActiveRecord::Base
  attr_accessible :name, :area_id, :levels_attributes
  
  belongs_to :area
  has_many :levels, :dependent => :destroy
  accepts_nested_attributes_for :levels, 
                                :reject_if => lambda { |a| a[:description].blank? }, 
                                :allow_destroy => true
  
  validates :name, :presence => true
  
  def percent_complete
    complete = levels.collect {|level| level if level.met}
    complete.compact!
    ((complete.length.to_f / levels.length.to_f)*100).to_i
  end
end
