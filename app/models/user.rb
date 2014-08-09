# Angharad Dare-Edwards and Jack Paget, August 2014 :: Script to control the user model
# Part of Angly's Notes site
#
# Change log 
# - added cookies to user data 
#

class User < ActiveRecord::Base

	include BCrypt

	attr_accessible :email, :first_name, :last_name, :user_name, :password, :password_confirmation, :payment_method
	attr_accessor :password
	before_save :encrypt_password
  before_create :create_unique_profile_id
  before_create { generate_token(:auth_token) }

    validates_confirmation_of :password , :message => "Sorry the passwords do not match"
    validates_presence_of :password, :message => "Please choose a password", :on => :create
  	validates_presence_of :email,:message=>"Please enter your e-mail address"
  	validates_uniqueness_of :email,:message => "This e-mail address is already registered, please login."
  	validates_presence_of :first_name , :message => "Please enter your first name"
  	validates_presence_of :last_name, :message => "Please enter your last name"
    validates_presence_of :user_name, :message => "Please choose a username"
    validates_uniqueness_of :user_name, :message => "Sorry that username is taken"

  # Authenticate the user by e-mail and password but check the password vs. the stored
  # encrypted password.

  def self.authenticate(email, password)
    user = find_by_email(email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end

  # Encrypt the password with BCrypt before adding it to the database don't add unencrypted
  # passwords to the database.

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  # Create an 8 digit unique ID to keep track across the database tables

  def create_unique_profile_id
    begin
      self.profile_id=SecureRandom.base64(8)
    end while self.class.exists?(:profile_id => profile_id)
  end

  # Make a token for password resets and parse it to the database then e-mail the link
  # to the user, store time so that the link can expire.

  def send_password_reset
    generate_token(:password_reset_token)
    self.password_reset_sent_at = Time.now
    save(validate:false)
    UserMailer.password_reset(self).deliver
  end

  def send_registration_confirmation
    UserMailer.registration_confirmation(self).deliver
  end

def generate_token(column)
  begin
    self[column] = SecureRandom.urlsafe_base64
  end while User.exists?(column => self[column])
end


end
