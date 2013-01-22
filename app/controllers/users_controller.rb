class UsersController < ApplicationController

  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, notice: 'Thank you for registering to help save the world!'
    else
      render 'new'
    end
  end

  def new
    @user = User.new
  end

end
