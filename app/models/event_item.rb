class EventItem < ApplicationRecord
  belongs_to :event
  belongs_to :event_item_type
  belongs_to :location
  has_many :responsibles
  has_many :inscription_items, :dependent => :destroy

  accepts_nested_attributes_for :responsibles, allow_destroy: true
  accepts_nested_attributes_for :inscription_items, allow_destroy: true

  validates :name, presence: true
  validates :value, presence: true
  validates_numericality_of :value, greater_than_or_equal_to: 0

  def check_if_location_is_present
    unless self.location
      self.location = self.event.location
    end
  end
end
