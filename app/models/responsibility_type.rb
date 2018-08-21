class ResponsibilityType < ApplicationRecord
  def to_s
    name
  end
  validates :name, presence: true
end
