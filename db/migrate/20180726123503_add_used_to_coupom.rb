class AddUsedToCoupom < ActiveRecord::Migration[5.1]
  def change
    add_column :coupoms, :used, :boolean, default: false
  end
end
