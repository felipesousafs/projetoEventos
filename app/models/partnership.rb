class Partnership < ApplicationRecord
  belongs_to :event
  belongs_to :institution
end
