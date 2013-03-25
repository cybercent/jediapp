class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :organization
  belongs_to :history
  belongs_to :cart

  has_many :donations

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name, :phone, :type
  

  
  accepts_nested_attributes_for :organization, :reject_if => :all_blank
  attr_accessible :organization_attributes
  
  ROLE_ADMIN   = 'admin'
  ROLE_MANAGER = 'manager'
  ROLE_DONOR   = 'donor'
  
  def admin?
    self.role == ROLE_ADMIN
  end
  
  def manager?
    self.role == ROLE_MANAGER
  end
  
  def donor?
    self.role == ROLE_DONOR
  end
  
  def after_initialize
      self.build_organization if self.organization.nil?
  end
end
