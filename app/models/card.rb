class Card < ApplicationRecord
  self.table_name = 'card'

  set_primary_key :card_id

  validates :card_id, presence: true, message: "ID can't be blank"

  has_many :card_groups
  has_many :access_groups, through: :card_groups
  has_many :access_logs

  ['after_hours', 'magic', 'disabled'].each do |field|
    class_eval %{
      def #{field}
        self['#{field}'] == 'Y'
      end
    }
  end
end
