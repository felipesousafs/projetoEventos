class DropTableEventTags < ActiveRecord::Migration[5.1]
  def change
    drop_table :event_tags
  end
end
