class CreateEventItems < ActiveRecord::Migration[5.1]
  def change
    create_table :event_items do |t|
      t.references :event, foreign_key: true
      t.string :name
      t.text :description
      t.decimal :value
      t.references :event_item_type, foreign_key: true

      t.timestamps
    end
  end
end
