class UsersController < ApplicationController
  def create
    @user = User.new
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.remember_me = params[:user][:remember_me]
    @user.save
  end

  def new
    @user = User.new
  end
end
