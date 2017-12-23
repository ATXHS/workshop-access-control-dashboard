class AddBasicIndexes < ActiveRecord::Migration[5.1]
  def change
    add_index 'access_group', ['name'], name: 'name'
    add_index 'access_log', ['logged', 'card_id'], name: 'logged'
    add_index 'door_access', ['access_group_id'], name: 'access_group_id'
    add_index 'door_access', ['door_id'], name: 'door_id'
    # For some reason this index is automatically created
    #add_index 'door', ['name'], name: 'name', unique: true
  end
end
