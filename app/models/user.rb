class User < ActiveRecord::Base
  before_save :encrypt_password
  after_create :create_profile

  # Include default devise modules. Others available are:
  # :confirmable,:lockable, and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :token_authenticatable,
         :trackable, :validatable

  attr_protected :is_admin
  
  has_many :services
  has_one :profile, :class_name => "UserProfile"
  delegate :gravatar_email, :headline, :is_coder, :name, :represents_org, :represents_team, :cause_list, :technology_list, :to => :profile
  
  validates_presence_of :password, :on => :create #will only run on account creation
  
  validates_presence_of :email    # will run in all validation contexts
  validates_uniqueness_of :email  # will run in all validation contexts
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end

  protected
  
  def create_profile
    @profile = UserProfile.new
    @profile.user_id = self.id
    @profile.save
  end
end
