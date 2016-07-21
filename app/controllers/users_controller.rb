class UsersController < ApplicationController
  def new
  end

  #strong params not from book
  def create
  	@user = User.new(user_params)
  	if @user.save
  		redirect_to @user, notice: 'User was successfully created.'
  	else
  		render action: 'new'
  	end
  end

  private
  # strong parameters
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
