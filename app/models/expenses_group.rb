class ExpensesGroup < ApplicationRecord
  belongs_to :expense
  belongs_to :group

  validates :expense_id, presence: true
  validates :group_id, presence: true
end
