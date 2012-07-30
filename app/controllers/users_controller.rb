class UsersController < ApplicationController
  resond_to :json

  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    @user.save
    respond_with @user, location: "/"
  end
end
