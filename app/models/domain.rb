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
  
  # Returns a new domain with the current user as the owner.
  def copy_to( user )
    new_domain = user.domains.build( :name => name )
    areas.each do |area|
      new_area = new_domain.areas.build( area )
      new_area.save
    end
    new_domain.save ? new_domain : nil
  end
end
