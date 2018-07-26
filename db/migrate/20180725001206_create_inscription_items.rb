class CreateInscriptionItems < ActiveRecord::Migration[5.1]
  def change
    create_table :inscription_items do |t|
      t.references :inscription, foreign_key: true
      t.decimal :value
      t.string :name

      t.timestamps
    end
  end
end
