class AddColumnsToEventItems < ActiveRecord::Migration[5.1]
  def change
    add_column :event_items, :permit_concomitance, :boolean, default: true
    add_column :event_items, :start_at, :datetime
    add_column :event_items, :end_at, :datetime
    add_column :event_items, :is_required, :boolean, default: false

  end
end
