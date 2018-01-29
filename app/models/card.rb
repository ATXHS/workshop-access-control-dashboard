class Card < ApplicationRecord
  self.table_name = 'card'
  self.primary_key = 'card_id'

  validates :card_id, presence: { message: "ID can't be blank" }

  has_many :card_groups
  has_and_belongs_to_many :access_groups,
    join_table: :card_group,
    autosave: true
  accepts_nested_attributes_for :access_groups
  has_many :access_logs

  ['after_hours', 'magic', 'disabled'].each do |field|
    class_eval %{
      def #{field}
        self['#{field}'] == 'Y'
      end
    }
  end
end
