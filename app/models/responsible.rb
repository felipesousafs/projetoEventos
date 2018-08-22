class Responsible < ApplicationRecord
  belongs_to :event_item
  belongs_to :responsibility_type

  validates :name, presence: true
end
