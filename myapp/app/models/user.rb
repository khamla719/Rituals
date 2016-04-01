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

  before_save :encrypt_password

  def self.find_by_email(email)
    first(conditions: { email: email })
  end

  def self.authenticate(email, password)
    if password_correct?(email, password)
      # Success!
      true
    else
      # Failed! :(
      false
    end
  end

  def self.password_correct?(user_email, password)
    user = find_by_email user_email
    return if user.nil?
    user_pass = Password.new(user.password_hash)
    user_pass == password
  end

  protected

  def encrypt_password
    self.password_hash = Password.create(@password)
  end
end
