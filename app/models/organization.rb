class Organization < ActiveRecord::Base
  attr_accessible :city, :contact_job, :contact_name, :department, :description, :email, 
  :fax, :name, :phone, :postal_code, :street_name, :street_number
  
  
  belongs_to :user
  has_many :projects
  
  accepts_nested_attributes_for :user
  
end
