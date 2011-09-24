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
    if new_domain.save
      areas.each do |area|
        new_area = new_domain.areas.build( :name => area.name )
        if new_area.save
          area.skills.each do |skill|
            new_skill = new_area.skills.build( :name => skill.name )
            if new_skill.save
              skill.levels.each do |level|
                new_level = new_skill.levels.build( :description => level.description )
                new_level.save
              end
            end
          end
        end
      end
    end
    new_domain
  end
  
  def to_hash
    domain_hash = {}
    areas_array = []
    areas.each {|area| areas_array << build_area_hash( area ) }
    domain_hash['areas'] = areas_array
    domain_hash
  end
  
  private
    
    def build_area_hash( area )
      skills_array = []
      area.skills.each {|skill| skills_array << build_skill_hash( skill ) }
      { 'name' => area.name, 'skills' => skills_array }
    end
    
    def build_skill_hash( skill )
      levels_array = []
      skill.levels.each {|level| levels_array << level.description }
      { 'name' => skill.name, 'levels' => levels_array }
    end
end
