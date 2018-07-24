class Event < ApplicationRecord
  has_many :event_items, :dependent => :destroy
  has_one :event_item_type, through: :event_items
  belongs_to :event_type
  belongs_to :user
  accepts_nested_attributes_for :event_items, allow_destroy: true
  validates_associated :event_items

end
