class User < ActiveRecord::Base
	has_secure_password	# automatically adds attr_accessor :password, :password_confirmation into the model 
	# This creates a form that accepts values from the user and has_secure_password will take those values and 
	# encrypt them into the password_digest field on the users table
end
