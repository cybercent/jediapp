class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.text :description
      t.string :contact_name
      t.string :contact_job
      t.string :street_name
      t.string :street_number
      t.string :city
      t.string :postal_code
      t.string :department
      t.string :phone
      t.string :fax
      t.string :email
      t.integer :user_id
      
      t.timestamps
    end
  end
end
