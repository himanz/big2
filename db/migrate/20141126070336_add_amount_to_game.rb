class AddAmountToGame < ActiveRecord::Migration
  def change
    add_column :games, :amount, :decimal
  end
end
