class SessionsController < ApplicationController
	def create
	    user = User.find_by(email: params[:session][:email].downcase)
	    if user && sign_in(user)
	      redirect_to user
	    else
	      flash.now[:error] = 'Invalid email/password combination'
	      render 'new'
	    end
	end

	def destroy
	  	sign_out
    	redirect_to root_url
	end
end
	
