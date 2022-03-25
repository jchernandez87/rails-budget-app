class RenameTable < ActiveRecord::Migration[7.0]
  def change
    rename_table :expenses_groups, :expense_groups
  end
end
