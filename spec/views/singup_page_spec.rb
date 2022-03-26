require 'rails_helper'

RSpec.describe 'Sing up page', type: :feature do
  it 'should have a title' do
    visit root_path
    expect(page).to have_content 'Expenser'
  end

  it 'should have a log in button' do
    visit root_path
    expect(page).to have_content 'LOG IN'
  end

  it 'should have a sing up button' do
    visit root_path
    expect(page).to have_content 'SING UP'
  end
end
