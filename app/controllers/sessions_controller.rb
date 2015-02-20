class SessionsController < ApplicationController
  def new
  end

  def create
    render 'new'
    # user = User.find_by(login: params[:session][:login].downcase)
    # if user && user.authenticate(params[:session][:password])
    #   sign_in ?user
    #   params[:session][:remember_me] == '1' ? remember(user) : forget(user)
    #   redirect_to user
    # else
    #   flash.now[:danger] = 'Invalid email/password combination'
    #   render 'new'
    # end
  end

  def destroy
  end
end
