require 'rails_helper'

RSpec.describe ExpensesGroup, type: :model do
  subject { ExpensesGroup.new(expense_id: 1, group_id: 1) }

  it 'expense_id should be present' do
    subject.expense_id = nil
    expect(subject).to_not be_valid
  end

  it 'group_id should be present' do
    subject.group_id = nil
    expect(subject).to_not be_valid
  end

  it 'expense_id is present' do
    expect(subject.expense_id).to eq(1)
  end

  it 'groupd_id is present' do
    expect(subject.group_id).to eq(1)
  end
end
