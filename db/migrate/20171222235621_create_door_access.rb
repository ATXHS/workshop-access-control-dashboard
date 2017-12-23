class CreateDoorAccess < ActiveRecord::Migration[5.1]
  def change
    create_table :door_access do |t|
      t.integer :door_id, null: false
      t.integer :access_group_id, null: false

      t.timestamps
    end
  end
end
