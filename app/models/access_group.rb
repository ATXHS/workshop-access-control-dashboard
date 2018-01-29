class AccessGroup < ApplicationRecord
  self.table_name = 'access_group'

  validates :name, presence: true

  has_and_belongs_to_many :cards,
    join_table: :card_group,
    autosave: true
  has_many :door_accesses
  has_many :doors, through: :door_accesses
end
