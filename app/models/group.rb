class Group < ApplicationRecord
  has_and_belongs_to_many :expenses
  belongs_to :author, class_name: 'User'

  validates :name, presence: true
  validates :icon, presence: true

  def self.total(id)
    expenses = Group.find(id).expenses
    total = 0
    expenses.each do |expense|
      total += expense.amount
    end
    total
  end
end
