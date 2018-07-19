class CreateCoupomTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :coupom_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
