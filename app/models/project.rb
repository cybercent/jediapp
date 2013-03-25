class Project < ActiveRecord::Base
  attr_accessible :contact_email, :contact_fax, :contact_name, :contact_phone, :description, :name
end
