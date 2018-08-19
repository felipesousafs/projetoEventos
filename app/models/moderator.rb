class Moderator < ApplicationRecord
  belongs_to :event
  belongs_to :user

  validates :event, uniqueness: { scope: :user,
                                 message: "O usuário selecionado já é moderador desse evento." }
end
