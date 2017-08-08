class SessionsController < ApplicationController
  
	def create
  	@user = User.find_by_email(params[:email])

  	if @user && @user.authenticate(params[:password])
  		session[:user_id] = @user.id
  		redirect_to "/users/#{@user.id}/home"
  	else
  		flash[:errors_login] = "Invalid combination"
  		redirect_to "/"
  	end
  	end

    def destroy
  	  session[:user_id] = nil
      redirect_to "/"
    end
end
