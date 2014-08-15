class UserMailer < ActionMailer::Base
  default from: "anglysnotes@gmail.com"

	def registration_confirmation(user)
  		@user = user
		mail(:to => user.email, :subject => "Registered")
 	end
	def password_reset(user)
  		@user = user
  		mail :to => user.email, :subject => "Password Reset"
	end

	def verified_notes(user, note_id)
		@user = user
		@note = Note.find(note_id)
		mail :to => user.email, :subject => "Notes Verified"

	end


end
