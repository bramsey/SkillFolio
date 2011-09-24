class PagesController < ApplicationController
  def index
    @domains = current_user.domains if user_signed_in?
  end

end
