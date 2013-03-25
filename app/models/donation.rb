class Donation < ActiveRecord::Base
  attr_accessible :amount, :project_id
  
  belongs_to :user
  belongs_to :project
end
