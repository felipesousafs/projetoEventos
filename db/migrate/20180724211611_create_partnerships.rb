class CreatePartnerships < ActiveRecord::Migration[5.1]
  def change
    create_table :partnerships do |t|
      t.string :name
      t.references :event, foreign_key: true
      t.references :institution, foreign_key: true

      t.timestamps
    end
  end
end
