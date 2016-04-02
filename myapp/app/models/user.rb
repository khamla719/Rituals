require 'bcrypt'

class User
  include Mongoid::Document
  include BCrypt

  attr_accessor         :password, :password_confirmation
  # attr_protected        :password_hash
  field :name, type: String
  field :email, type: String
  field :password_hash, :type => String
  field :content, type: Array

  # validates_presence_of :email, :message => "Email Address is Required."
  # validates_uniqueness_of :email, :message => "Email Address Already In Use. Have You Forgot Your Password?"
  # validates_format_of :email, :with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i, :message => "Please Enter a Valid Email Address."
  # validates_acceptance_of :accept_terms, :allow_nil => false, :accept => true, :message => "Terms and Conditions Must Be Accepted."
  # validates_length_of :password, :minimum => 8, :message => "Password Must Be Longer Than 8 Characters."
  # validates_confirmation_of :password, :message => "Password Confirmation Must Match Given Password."

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password_plaintext)
    @password = BCrypt::Password.create(new_password_plaintext)
    self.password_hash = @password.to_s
  end

  def authenticate(password_plaintext)
    return self.password == password_plaintext
  end
end
