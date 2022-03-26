require 'rails_helper'

RSpec.describe 'Expenses page', type: :feature do
  before :each do
    @user = User.create(id: 1, email: 'emai@mail.com', name: 'joe', password: 'password')
    @group = Group.create(id: 1, name: 'food', icon: 'icon_url', author_id: @user.id)
    sign_in @user
  end

  it 'should have a title' do
    visit group_expenses_path(@group.id)
    expect(page).to have_content 'FOOD EXPENSES'
  end

  it 'should have a total' do
    visit group_expenses_path(@group.id)
    expect(page).to have_content 'Total'
  end

  it 'should have a text when no expense exists' do
    visit group_expenses_path(@group.id)
    expect(page).to have_content "Currently you don't have any expense for this category"
  end

  it 'should have an add new expense button' do
    visit group_expenses_path(@group.id)
    expect(page).to have_content 'NEW EXPENSE'
  end
end
