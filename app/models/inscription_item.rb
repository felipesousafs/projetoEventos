class InscriptionItem < ApplicationRecord
  belongs_to :inscription
  belongs_to :event_item
end
