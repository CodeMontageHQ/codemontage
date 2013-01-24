class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable,:lockable, and :timeoutable
  devise :database_authenticatable, :registerable, #, :omniauthable, :registerable,
         :recoverable, :rememberable, :token_authenticatable,
         :trackable, :validatable

  attr_protected :is_admin
  
  before_save :encrypt_password
  
  validates_presence_of :password, :on => :create #will only run on account creation
  
  validates_presence_of :email    # will run in all validation contexts
  validates_uniqueness_of :email  # will run in all validation contexts
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
