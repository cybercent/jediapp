class Project < ActiveRecord::Base
  attr_accessible :contact_email, :contact_fax, :contact_name, :contact_phone, :description, :name
  
  belongs_to :organization
  belongs_to :history
  belongs_to :cart
  
  has_many :donations
  has_many :assets
  
  default_scope where(:aasm_state => 'online')
  
  include AASM
  aasm_initial_state :online
  aasm_state :online
  aasm_state :deleted
  
  aasm_event :delete_it do
    transitions :to => :deleted, :from => [:online]
  end
  
end
