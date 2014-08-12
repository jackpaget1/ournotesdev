class Contact < MailForm::Base
	attribute :c_name, :validate => true
	attribute :c_email, :validate => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	attribute :message
	attribute :nickname, :captcha => true

	def headers 
		{
			:subject => "Contact from Angly's Notes User",
			:to => "anglysnotes@gmail.com",
			:from => %("#{c_name}" <#{c_email}>) 
		}
	end


end
