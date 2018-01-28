class AccessGroup < ApplicationRecord
  self.table_name = 'access_group'

  validates :name, presence: true

  has_many :door_accesses
  has_many :doors, through: :door_accesses
end
