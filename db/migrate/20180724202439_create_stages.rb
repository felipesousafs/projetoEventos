class CreateStages < ActiveRecord::Migration[5.1]
  def change
    create_table :stages do |t|
      t.references :event, foreign_key: true
      t.string :name
      t.text :description
      t.datetime :date_start
      t.datetime :date_end

      t.timestamps
    end
  end
end
