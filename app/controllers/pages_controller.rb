class PagesController < ApplicationController
  def index
    redirect_to domains_path if user_signed_in?
  end

end
