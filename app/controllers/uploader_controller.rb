class UploaderController < ApplicationController

  
 def self.save(upload)
    name =  upload['datafile'].original_filename
    directory = "public/data"
    # create the file path
    path = File.join(directory, name)
    # write the file
    File.open(path, "wb") { |f| f.write(upload['datafile'].read) }
  end



  def profile
    @notes = Note.where(:profile_id => current_user.profile_id)
  end

  def files
  end
end
