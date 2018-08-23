class AddIsAutomaticToCoupoms < ActiveRecord::Migration[5.1]
  def change
    add_column :coupoms, :is_automatic, :boolean, default: false
  end
end
