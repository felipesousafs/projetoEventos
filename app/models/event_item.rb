class EventItem < ApplicationRecord
  belongs_to :event
  belongs_to :event_item_type
end
