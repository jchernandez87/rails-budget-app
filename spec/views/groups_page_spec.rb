require 'rails_helper'

RSpec.describe 'Groups page', type: :feature do
  before :each do
    @user = User.create(id: 1, email: 'emai@mail.com', name: 'joe', password: 'password')
    sign_in @user
  end

  it 'should have a title' do
    visit groups_path
    expect(page).to have_content 'CATEGORIES'
  end

  it 'should have a add cateory text' do
    visit groups_path
    expect(page).to have_content 'Please add your first category'
  end

  it 'should have a logut button' do
    visit groups_path
    expect(page).to have_content 'Logout'
  end

  it 'should have an add category button' do
    visit groups_path
    expect(page).to have_content 'ADD A NEW CATEGORY'
  end
end
