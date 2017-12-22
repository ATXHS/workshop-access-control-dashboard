class CreateCardGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :card_group do |t|
      t.string :card_id, limit: 50, null: false
      t.integer :access_group_id, null: false

      t.timestamps
    end
  end
end
