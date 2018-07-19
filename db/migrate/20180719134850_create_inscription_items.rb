class CreateInscriptionItems < ActiveRecord::Migration[5.1]
  def change
    create_table :inscription_items do |t|
      t.string :name
      t.float :value

      t.timestamps
    end
  end
end
