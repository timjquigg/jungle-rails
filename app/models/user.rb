class User < ApplicationRecord

  has_secure_password

	# Verify that email field is not blank and that it doesn't already exist in the db (prevents duplicates):
	validates :email, presence: true, uniqueness: { case_sensitive: false }
	validates :password_confirmation, presence: true
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :password, length: { minimum: 6 }

	def self.authenticate_with_credentials(email, password)
		# Look up User in db by the email address submitted to the login form and
    # convert to lowercase to match email in db in case they had caps lock on:
    @user = User.find_by(email: email.strip.downcase)
    
    # Verify user exists in db and run has_secure_password's .authenticate() 
    # method to see if the password submitted on the login form was correct: 
		if @user && @user.authenticate(password)
			return @user
		else
			return nil
		end

	end

end
