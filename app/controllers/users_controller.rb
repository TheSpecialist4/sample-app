class UsersController < ApplicationController
  # renders the signup form, using the new file in view/users/new
  def new
    # empty instance used in the new view
    @user = User.new
  end

  def show
  	@user = User.find_by_id(params[:id])
  end

  # creates new user from form's params
  def create
  	@user = User.new(user_params)
    #@user = User.new(params[:user])
  	if @user.save
      sign_in @user
      flash[:success] = "Welcome to Sample App!"
  		redirect_to @user
  	else
  		render 'new'
  	end
  end

  private
  # strong parameters
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
