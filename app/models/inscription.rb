class Inscription < ApplicationRecord
  has_many :inscription_items
  belongs_to :event
  belongs_to :user
  belongs_to :coupom, optional: true

end
