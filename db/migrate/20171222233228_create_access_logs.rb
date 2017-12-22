class CreateAccessLogs < ActiveRecord::Migration[5.1]
  def change
    create_table :access_log do |t|
      t.datetime :logged, null: false
      t.string :card_id, limit: 50
      t.string :door, limit: 50
      t.string :action, limit: 1
      t.string :detail

      t.timestamps
    end
  end
end
