class SessionsController < ApplicationController
  def welcome
  end
# logout
  def destroy
    # when you want to log someone out you
    # want to get rid of them in the session

    session.delete(:user_id)
    redirect_to '/'
  end

  def new
  end

  def create
    # if we have params of a provider. note: change route
    if params[:provider] = 'google_oauth2'
      @user = User.create_by_google_omniauth(auth)
      session[:user_id] = @user.id
      redirect_to user_path(@user)

    elsif params[:provider] == 'github'
      @user = User.create_by_github_omniauth(auth)
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else

      @user = User.find_by(username: params[:user][:username])
      if @user.try(:authenticate, params[:user][:password])
        session[:user_id] = @user.id
        redirect_to user_path(@user)
      else
        flash[:error] = "Sorry, login info was incorrect. Please try again."
        redirect_to login_path
      end
    end
  end

  def omniauth

    # we are finding stuff off of email: auth[:info][:email]
    # and we are also able to set other attributes
    @user = User.create_by_google_omniauth(auth)

    session[:user_id] = @user.id
    redirect_to user_path(@user)

  end

  private

  def auth
    request.env['omniauth.auth']
  end
end

# Notes:
# SessionsController#omniauth :
# these below save in one step
# User.find_or_create_by(email: auth[:info][:email])
# 1. it looks in our db to see if their is anyone with that email
# and if their is someone with that email exist it uses that first result of our user
# 2. or if no one does exist it will initalize a new user
# User.where(email: auth[:info][:email]).first_or_initalize
