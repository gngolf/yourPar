class UsersController < ApplicationController
  

  def index
    session[:user_id] = nil
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
    @count = Stat.where(user_id:session[:user_id]).count
    @all_users = User.all
  end
  
  private
    def user_params
    	params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end

   
end

