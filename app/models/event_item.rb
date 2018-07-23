class EventItem < ApplicationRecord
  belongs_to :event
  has_one :event_item_type
end
