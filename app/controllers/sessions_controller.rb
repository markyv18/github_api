class SessionsController < ApplicationController

  def create
    user = User.from_omniauth(request.env['omniauth.auth'])

    session[:user_id] = user.id if user.present?

    redirect_to root_path
  end

  def destroy
    session.clear
    flash[:notice] = 'Successfully logged out'
    redirect_to root_path
  end
end
