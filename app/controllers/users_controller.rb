class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    # @users is loaded by CanCanCan
  end

  def show
    # @user is loaded by CanCanCan
  end
end
