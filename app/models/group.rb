class Group < ApplicationRecord
  has_and_belongs_to_many :expenses
  belongs_to :author, class_name: 'User'

  validates :name, presence: true
  validates :icon, presence: true
end
