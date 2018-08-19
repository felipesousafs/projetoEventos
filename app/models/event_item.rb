class EventItem < ApplicationRecord
  belongs_to :event
  belongs_to :event_item_type
  has_many :inscription_items

  validates :name, presence: true
  validates :value, presence: true
  validates_numericality_of :value, greater_than_or_equal_to: 0
end
