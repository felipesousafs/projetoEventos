class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :attr_name
      t.string :attr_value
      t.references :responsible, foreign_key: true

      t.timestamps
    end
  end
end
