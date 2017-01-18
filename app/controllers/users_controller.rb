class UsersController < ApplicationController
  def index
  end
  def new
  	@user = User.new
  end
  def create
  	@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to "/users/#{@user.id}/home"
  	else
      flash[:errors] = @user.errors.full_messages
  		redirect_to :back
  	end
  end
  def home
  	@user = User.find(params[:id])
  end
  private
    def user_params
    	params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
