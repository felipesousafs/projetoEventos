class AddLocationToEventItems < ActiveRecord::Migration[5.1]
  def change
    add_reference :event_items, :location, foreign_key: true
  end
end
