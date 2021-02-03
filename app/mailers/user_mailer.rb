class UserMailer < ApplicationMailer
	 

	def welcome_email(user)	
		mail(from: 'jignesh.nai@inuscg.com', to: user, subject: 'Welcome to My Awesome Site')
	end
end
