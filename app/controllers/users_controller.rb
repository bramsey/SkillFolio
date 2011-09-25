class UsersController < ApplicationController
  def show
    @user = User.find_by_alias( params[:alias] )
  end

end
