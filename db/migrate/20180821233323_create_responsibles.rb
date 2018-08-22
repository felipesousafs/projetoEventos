class CreateResponsibles < ActiveRecord::Migration[5.1]
  def change
    create_table :responsibles do |t|
      t.string :name
      t.references :event_item, foreign_key: true
      t.text :description
      t.references :responsibility_type, foreign_key: true

      t.timestamps
    end
  end
end
