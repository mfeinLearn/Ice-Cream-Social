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
    #Try to find the user in the system
    @user = User.find_by(username: params[:user][:username])
    #did we find someone & did they put in the right password?

    ## try: ##
    # before calling the method it says is my user nil or is my user something.

    # nil - if nil it will not even call authenticate
    ## if their is no user it will return nil (which is a false value when it is being evaluated by if )
    # found user -> if we did find the user then it will call authenticate
    ## but if it does find the user it will do the authenticate and if the password is wrong it will return false
          ### if the password is correct it will return the object




    #if @user && user.authenticate(params[:user][:password])
    # ^ this and below works the same
    if @user.try(:authenticate, params[:user][:password])# yes you are authenticated and good to go to explore the app
      # they are officially loggedin
      session[:user_id] = @user.id
      # after logged in redirect to user show page
      redirect_to user_path(@user)
    else
      #if they are not correctly logged in
      flash[:error] = "Sorry, login info was incorrect. Please try again."

      # the reasons why we redirect them there is because if someone wants to guess your information it
      # makes them a little bit harder if your username is not persisted
      # and they guess wrong
      redirect_to login_path
    end
    #byebug
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
