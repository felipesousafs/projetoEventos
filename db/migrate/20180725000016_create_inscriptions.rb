class CreateInscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :inscriptions do |t|
      t.boolean :paid
      t.references :event, foreign_key: true
      t.references :user, foreign_key: true
      t.references :coupom, foreign_key: true
      t.datetime :paid_at

      t.timestamps
    end
  end
end
