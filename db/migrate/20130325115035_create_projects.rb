class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.text :description
      t.string :contact_name
      t.string :contact_phone
      t.string :contact_email
      t.string :contact_fax
      t.integer :organization_id
      
      t.timestamps
    end
  end
end
