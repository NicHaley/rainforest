class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:email])	# find a user by the email typed in the email input field
		if user && user.authenticate(params[:password])	# Verify password matches email
			session[:user_id] = user.id
			redirect_to products_url, notice: "Logged in!"
			# This gist of logging in is that we are setting a hash in our users' 
			# browser to let our server (application) reference as they navigate 
			# through the application.
		else
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to products_url, notice: "Logged out!"
	end
end
