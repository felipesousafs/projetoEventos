class Responsible < ApplicationRecord
  belongs_to :event_item
  belongs_to :responsibility_type
  has_many :items

  accepts_nested_attributes_for :items, allow_destroy: true

  validates :name, presence: true
end
