class Item < ApplicationRecord
  belongs_to :responsible

  validates :attr_name, presence: true
  validates :attr_value, presence: true
end
