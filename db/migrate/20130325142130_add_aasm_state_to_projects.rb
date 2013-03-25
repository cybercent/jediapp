class AddAasmStateToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :aasm_state, :string, :default => 'online'
  end
end
