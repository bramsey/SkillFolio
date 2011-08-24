class AreasController < ApplicationController
  before_filter :authenticate_user!
  
  respond_to :html, :js
  
  def index
    @domain = Domain.find( params[:domain_id] )
    @areas = @domain.areas
  end
  
  def show
    @area = Area.find( params[:id] )
  end
  
  def new
    @domain = Domain.find( params[:domain_id] )
  end
  
  def edit
    @area = Area.find( params[:id] )
  end
  
  def create
    @domain = Domain.find(params[:area][:domain_id])
    
    @area  = @domain.areas.build(params[:area])
    @area.save ?
      flash[:success] = 'Area created!' :
      flash[:error] = 'Area not saved.'
    
    redirect_to domain_areas_path(@domain)
  end
  
  def update
    @area = Area.find(params[:id])
    @area.update_attributes(params[:area]) ?
      flash[:success] = "Area updated." :
      flash[:error] = "Area not updated."
      
    respond_with @area
  end
  
  def destroy
    @area.destroy ?
      flash.now[:success] = 'Area deleted.' :
      flash.now[:error] = 'Error deleting area.'
    
    respond_with @area
  end
  
  private

end
