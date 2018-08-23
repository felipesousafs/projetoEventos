class AddIsDirectInscriptionToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :is_direct_inscription, :boolean, default: false
    add_column :events, :value, :decimal
  end
end
