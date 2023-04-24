class ChangePriceToBeDecimalInBooks < ActiveRecord::Migration[7.0]
  def change
    change_column :books, :price, :decimal
  end
end
