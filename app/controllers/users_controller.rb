class UsersController < ApplicationController
  respond_to :json

  def create
    @user = User.new(user_params)
    @user.save
    respond_with @user, location: "/"
  end

  private

  def user_params
    params.slice(:email, :password)
  end
end
