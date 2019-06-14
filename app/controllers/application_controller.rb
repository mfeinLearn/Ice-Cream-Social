class ApplicationController < ActionController::Base

  private

  def current_user
    # use find_by_id so it does not error out. It will just
    # be null if it does not exist

    # ||= it will only call the database once if you are using current more then once in a method 

    @current_user ||= User.find_by_id(session[:user_id])
  end
end
