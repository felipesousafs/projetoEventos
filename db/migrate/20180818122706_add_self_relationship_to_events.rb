class AddSelfRelationshipToEvents < ActiveRecord::Migration[5.1]
  def change
    add_reference :events, :event, foreign_key: true
    add_column :events, :is_principal, :boolean, default: true
  end
end
