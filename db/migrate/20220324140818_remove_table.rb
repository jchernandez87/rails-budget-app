class RemoveTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :expense_groups
  end
end
