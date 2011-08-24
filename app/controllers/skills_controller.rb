class SkillsController < ApplicationController
  before_filter :authenticate_user!
  
  respond_to :html, :js
  
  def show
    @skill = Skill.find( params[:id] )
  end
  
  def new
    @area = Area.find( params[:area_id] )
  end
  
  def edit
    @skill = Skill.find( params[:id] )
  end
  
  def create
    @area = Area.find(params[:skill][:area_id])
    
    @skill  = @area.skills.build(params[:skill])
    @skill.save ?
      flash[:success] = 'Skill created!' :
      flash[:error] = 'Skill not saved.'
    
    redirect_to area_path(@area)
  end
  
  def update
    @skill = Skill.find(params[:id])
    @skill.update_attributes(params[:skill]) ?
      flash[:success] = "Skill updated." :
      flash[:error] = "Skill not updated."
      
    respond_with @skill
  end
  
  def destroy
    @skill.destroy ?
      flash.now[:success] = 'Skill deleted.' :
      flash.now[:error] = 'Error deleting skill.'
    
    respond_with @skill
  end
end
