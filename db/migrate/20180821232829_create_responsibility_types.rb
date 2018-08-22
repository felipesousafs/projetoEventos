class CreateResponsibilityTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :responsibility_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
