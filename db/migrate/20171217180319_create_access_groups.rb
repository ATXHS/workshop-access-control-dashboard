class CreateAccessGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :access_group, force: true do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
