class DomainsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show]
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
      redirect_to domains_path
    else
      render 'domains/index'
    end
  end
  
  def destroy
    @domain.destroy ?
      flash.now[:success] = 'Domain deleted.' :
      flash.now[:error] = 'Error deleting domain.'
    
    respond_with @domain
  end
  
  private
  
    def load
      @user = current_user
      @domains = @user.domains
    end
end
