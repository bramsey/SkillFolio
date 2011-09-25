module ApplicationHelper
  
  def level_rank( level )
    ((level.skill.levels.index(level) + 1).to_f/level.skill.levels.length.to_f*10).to_i.to_s
  end
  
  def siteNav
    delimeter = ' - '
    if user_signed_in?
      link(current_user.alias, "/#{current_user.alias}") + delimeter +
      link("Dashboard", root_path) + delimeter +
      link("Domains", domains_path) + delimeter +
      link('Settings', edit_registration_path(current_user)) + delimeter + 
      link("Log Out", destroy_user_session_path)
    else
      #put logged_out links here.
    end
  end
  
  def link(label, path)
    if request.fullpath == path || label.downcase == params[:controller]
      link_to label, path, :class => 'selected'
    else
      link_to label, path
    end
  end
end
