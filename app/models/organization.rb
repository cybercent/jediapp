class Organization < ActiveRecord::Base
  attr_accessible :city, :contact_job, :contact_name, :department, :description, :email, :fax, :name, :phone, :postal_code, :street_name, :street_number
end
