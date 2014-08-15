module SecureDownloadsHelper

	
	def encrypt_urls(note_url)
		verifier = ActiveSupport::MessageVerifier.new('VJ5VX8RIRE')
  		@signed_m = verifier.generate(note_url)
  	end 
end
