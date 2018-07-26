class Event < ApplicationRecord
  has_many :stages
  has_many :event_items, :dependent => :destroy
  has_many :partnerships
  has_many :institutions, through: :partnerships
  has_many :inscriptions
  has_many :coupoms
  has_one :event_item_type, through: :event_items
  belongs_to :event_type
  belongs_to :user

  accepts_nested_attributes_for :event_items, allow_destroy: true
  accepts_nested_attributes_for :stages, allow_destroy: true
  accepts_nested_attributes_for :partnerships, allow_destroy: true
  accepts_nested_attributes_for :coupoms, allow_destroy: true

  validates_associated :event_items
  validates_associated :stages

end
