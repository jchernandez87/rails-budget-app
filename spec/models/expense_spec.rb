require 'rails_helper'

RSpec.describe Expense, type: :model do
  subject { Expense.new(id: 1, name: 'pizza', amount: 5.0, author_id: 1) }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be present' do
    subject.amount = nil
    expect(subject).to_not be_valid
  end

  it 'amount should be a number' do
    subject.amount = 'string'
    expect(subject).to_not be_valid
  end

  it 'name is present' do
    expect(subject.name).to eq('pizza')
  end

  it 'amount is present' do
    expect(subject.amount).to eq(5.0)
  end
end
