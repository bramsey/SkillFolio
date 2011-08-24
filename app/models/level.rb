class Level < ActiveRecord::Base
  attr_accessible :description
  
  belongs_to :skill
  
end
