class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.integer :user_id
      t.integer :project_id
      t.timestamps
    end
    
    add_index :carts, :user_id
    add_index :carts, :project_id
  end
end
