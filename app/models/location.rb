class Location < ApplicationRecord

  belongs_to :location, optional: true
  has_many :locations

  def complete_location
    "#{self.location.complete_location + " > " if self.location}" + self.name
  end
end
