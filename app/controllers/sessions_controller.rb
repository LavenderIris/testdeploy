class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:index, :login, :create]
  
  def index
  end

  def login
    user = User.find_by_email(params[:email]).try(:authenticate, params[:password])
    if user
      session[:id] = user.id
      session[:firstname]= user.firstname
      session[:lastname] = user.lastname
      redirect_to '/groups'
    else 
      flash[:errors]= ["user not found and/or password doesn't match"]
      redirect_to '/main'
    end
  end

  
  def logout
    reset_session
    redirect_to "/main"
  end

end
