class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :card, primary_key: 'card_id', force: true do |t|
      t.string :user, null: false
      t.string :nick
      t.string :after_hours, limit: 1, null: false
      t.datetime :expires, null: false
      t.datetime :valid_from, null: false
      t.string :disabled, limit: 1, null: false
      t.string :magic, limit: 1, null: false

      t.timestamps
    end
  end
end
