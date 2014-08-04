ActionMailer::Base.smtp_settings = {  
      :address              => "smtp.gmail.com",  
      :port                 => 587,  
      :domain               => "gmail.com",  
     :user_name            => "anglysnotes@gmail.com", #Your user name
      :password             => "Whisper10", # Your password
      :authentication       => "plain",  
      :enable_starttls_auto => true  
   }