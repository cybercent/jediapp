class CreateHistories < ActiveRecord::Migration
  def change
    create_table :histories do |t|
      t.integer :user_id
      t.integer :project_id
      t.timestamps
    end
    
    add_index :histories, :user_id
    add_index :histories, :project_id
  end
end
