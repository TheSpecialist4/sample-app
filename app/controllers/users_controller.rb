class UsersController < ApplicationController
  # before filter makes the particular method here make user sign in
  # to be executed before every action.
  # only applies filter only to the specified actions
  before_filter :make_user_sign_in, only: [:edit, :update, :index]
  before_filter :correct_user, only: [:edit, :update]
  before_filter :get_signed_in_user, only: [:edit, :update]

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

  # render the edit page
  def edit
    # in view when constructing form using form_for
    # rails uses POST if @user.new_record? is true
    # and PUT otherwise
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find(params[:id])
    # update_attributes(params[:user]) not working
    if @user.update_attributes(
              name: params[:user][:name],
              email: params[:user][:email],
              password: params[:user][:password],
              password_confirmation: params[:user][:password_confirmation]
              )
      flash[:success] = "Profile updated"
      sign_in @user
      redirect_to @user
    else
      render 'edit'
    end
  end

  def index
    @users = User.paginate(page: params[:page])
  end

  private
  # strong parameters
  def user_params
  	params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def make_user_sign_in
    # same as flash[:notice] = "Please sign in."
    # redirect_to signin_path
    redirect_to signin_path, notice: "Please sign in." unless signed_in?
  end

  def correct_user
    @user = User.find_by_id(params[:id])
    redirect_to(denied_path) unless current_user?(@user)
  end

  def get_signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Please sign in"
    end
  end
end
