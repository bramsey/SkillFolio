module ApplicationHelper
  
  def level_rank( level )
    ((level.skill.levels.index(level) + 1).to_f/level.skill.levels.length.to_f*10).to_i.to_s
  end
end
