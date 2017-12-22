class CreateDoors < ActiveRecord::Migration[5.1]
  def change
    create_table :door do |t|
      t.string :name, limit: 50, null: false
      t.string :default_unlocked, limit: 1, null: false

      t.timestamps
    end
  end
end
