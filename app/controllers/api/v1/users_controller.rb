class API::V1::UsersController < ApplicationController
  before_action :set_user, only: [:show, :destroy, :update]
  respond_to :json
  skip_before_action :require_login 
  
  def index
    @users = User.all
  end

  def create
    
  end

  def update
    
  end

  def show
  end
  
  def destroy
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :password_digest)
  end
end
