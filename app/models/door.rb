class Door < ApplicationRecord
  self.table_name = 'door'

  validates :name, presence: true

  has_many :door_accesses
  has_many :access_groups, through: :door_accesses

  before_create :set_default_unlocked

  def set_default_unlocked
    self.default_unlocked ||= 'N'
  end

  def display_name
    name.gsub('_',' ')
  end
end
