class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by_id(params[:id])
    # manage where the users goes if error occurs
    redirect_to '/' if !@user
  end

  private

  def user_params
    # our object that comes through our params which is user
    params.require(:user).permit(:username, :password)
  end
end
# for a log in sometimes people use a form tag instead
# because the login is not creating a user which is why people
# use the form_tag

#signup use form for because it is a form for a new user and we are
#creating that user
