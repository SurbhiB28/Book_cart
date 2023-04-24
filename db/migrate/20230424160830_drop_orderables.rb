class DropOrderables < ActiveRecord::Migration[7.0]
  def change
    drop_table :orderables
  end
end
