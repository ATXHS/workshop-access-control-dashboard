class CardGroup < ApplicationRecord
  self.table_name = 'card_group'

  belongs_to :access_group
  belongs_to :card
end
