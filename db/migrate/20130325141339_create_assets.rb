class CreateAssets < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.integer :project_id
      t.attachment :file
      t.timestamps
    end
  end
end
