class SessionsController < ApplicationController

  def new
    # No need for anything in here, we are just going to render our
    # new.html.erb AKA the login page
  end

  def create
    email = params[:login][:email]
    password = params[:login][:password]
    if user = User.authenticate_with_credentials(email, password) 
      # Save the user.id in that user's session cookie:
      session[:user_id] = user.id.to_s
      redirect_to root_path, notice: 'Successfully logged in!'
    else
      # if email or password incorrect, re-render login page:
      flash.now.alert = "Incorrect email or password, try again."
      render :new
    end
  end

  def destroy
    # delete the saved user_id key/value from the cookie:
    session.delete(:user_id)
    redirect_to login_path, notice: "Logged out!"
  end
  
end
