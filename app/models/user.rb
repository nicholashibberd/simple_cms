class User
  include Mongoid::Document
  field :name, :type => String
  field :email, :type => String
  field :encrypted_password
  field :salt
  field :remember_token

  EmailRegex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/  
  
  attr_accessor :password, :confirm_password
  
  validates_format_of	:email, :with => EmailRegex
  validates_uniqueness_of :email, :case_sensitive => false
  validates_confirmation_of :password
  
  validates_presence_of :name, :on => :create
  validates_presence_of :password, :on => :create
  validates_length_of	:password, :within => 6..40, :on => :create
  
  before_save :encrypt_password
  
  def self.find_by_email(email)
    User.where(:email => email).first
  end

  def self.find_by_remember_token(remember_token)
    User.where(:remember_token => remember_token).first
  end
  
  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end
  
  def self.authenticate(email, submitted_password)
    user = User.find_by_email(email)
     return nil if user.nil?
     return user if user.has_password?(submitted_password)
  end

  def remember_me!
    self.remember_token = encrypt("#{salt}--#{id}")
    save(:validate => false)
  end
  
  private
  
  def encrypt_password
    unless password.nil?
      self.salt = make_salt
      self.encrypted_password = encrypt(password)
    end
  end
  
  def encrypt(string) 
    secure_hash("#{salt}#{string}")
  end
  
  def make_salt
    secure_hash("#{Time.now.utc}#{password}")
  end
  
  def secure_hash(string)
    Digest::SHA2.hexdigest(string)
  end    
  
end
