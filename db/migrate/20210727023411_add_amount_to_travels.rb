class AddAmountToTravels < ActiveRecord::Migration[6.1]
  def change
    add_column :travels, :amount, :float
  end
end
