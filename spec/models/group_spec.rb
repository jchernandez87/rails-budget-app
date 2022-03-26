require 'rails_helper'

RSpec.describe Group, type: :model do
  subject { Group.new(id: 1, name: 'food', icon: 'url', author_id: 1) }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'icon should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'name is present' do
    expect(subject.name).to eq('food')
  end

  it 'icon is present' do
    expect(subject.icon).to eq('url')
  end
end
