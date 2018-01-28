class DoorAccess < ApplicationRecord
  self.table_name = 'door_access'

  belongs_to :access_group
  belongs_to :door
end
