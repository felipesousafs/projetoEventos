class AddEventItemToInscriptionItem < ActiveRecord::Migration[5.1]
  def change
    add_reference :inscription_items, :event_item, foreign_key: true
  end
end
