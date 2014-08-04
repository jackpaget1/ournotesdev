class BrowseController < ApplicationController
  def home
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
