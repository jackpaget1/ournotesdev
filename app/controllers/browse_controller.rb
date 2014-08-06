class BrowseController < ApplicationController
  def home
    current_user = @current_user
  end

  def profile
  	if @user
  		redirect_to 'profile'
  	else
  		redirect_to 'login'
  	end
  end

  def message
  end

  def aboutus
  end
end
