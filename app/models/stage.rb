class Stage < ApplicationRecord
  belongs_to :event

  validates :name, presence: true
  validates :date_start, presence: true
  validates :date_end, presence: true
end
