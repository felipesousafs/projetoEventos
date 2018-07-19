class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :name
      t.text :description
      t.references :event_type, foreign_key: true
      t.references :user, foreign_key: true
      t.json :tags

      t.timestamps
    end
  end
end
