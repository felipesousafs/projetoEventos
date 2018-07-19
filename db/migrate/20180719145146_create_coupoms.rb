class CreateCoupoms < ActiveRecord::Migration[5.1]
  def change
    create_table :coupoms do |t|
      t.string :value
      t.string :key
      t.date :expiration

      t.timestamps
    end
  end
end
