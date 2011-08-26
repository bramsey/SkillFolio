class Domain < ActiveRecord::Base
  attr_accessible :name
  
  belongs_to :user
  has_many :areas, :dependent => :destroy
  
  validates :name, :presence => true
  
  def percent_complete
    sum = 0
    areas.each {|area| sum += area.percent_complete.to_i }
    areas.empty? ? 0 : sum / areas.length
  end
end
