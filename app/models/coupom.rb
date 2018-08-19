class Coupom < ApplicationRecord
  belongs_to :event
  belongs_to :coupom_type

  validates :expiration, presence: true
  validates :key, presence: true
  validates :value, presence: true

  validates_numericality_of :value, greater_than: 0
end
