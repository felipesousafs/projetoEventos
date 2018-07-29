class Coupom < ApplicationRecord
  belongs_to :event
  belongs_to :coupom_type
end
