require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(id: 1, email: 'mail@mail.com', name: 'Joe', password: 'password') }

  it 'email should be present' do
    subject.email = nil
    expect(subject).to_not be_valid
  end

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'password should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'email is present' do
    expect(subject.email).to eq('mail@mail.com')
  end

  it 'name is present' do
    expect(subject.name).to eq('Joe')
  end

  it 'password is present' do
    expect(subject.password).to eq('password')
  end
end
