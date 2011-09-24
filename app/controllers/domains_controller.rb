class DomainsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]
  before_filter :load, :only => [:index]
  
  respond_to :html, :js
  
  def index
  end
  
  def show
    @domain = Domain.find( params[:id] )
  end
  
  def new
    @domain = Domain.new
  end
  
  def create
    @domain  = current_user.domains.build(params[:domain])
    if @domain.save
      flash[:success] = 'Domain created!'
      respond_with @domain
    else
      render 'domains/index'
    end
  end
  
  def destroy
    @domain = Domain.find( params[:id] )
    @domain.destroy ?
      flash.now[:success] = 'Domain deleted.' :
      flash.now[:error] = 'Error deleting domain.'
    
    respond_with @domain
  end
  
  def copy
    @domain = Domain.find( params[:id] )
    @new_domain = @domain.copy_to current_user
    @new_domain ? 
      flash[:success] = 'Domain copied successfully.' :
      flash[:error] = 'Could not copy domain.'
    
    @new_domain ||= @domain
    redirect_to @new_domain
  end
  
  private
  
    def load
      @domains = Domain.all
    end
end
