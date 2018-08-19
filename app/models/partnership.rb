class Partnership < ApplicationRecord
  belongs_to :event
  belongs_to :institution

  validates :name, presence: true
end
