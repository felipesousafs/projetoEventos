class AddEventAndCoupomTypeToCoupom < ActiveRecord::Migration[5.1]
  def change
    add_reference :coupoms, :event, foreign_key: true
    add_reference :coupoms, :coupom_type, foreign_key: true
  end
end
