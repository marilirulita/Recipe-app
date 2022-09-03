require 'rails_helper'

RSpec.describe 'Foods', type: :system do
  before do
    driven_by(:rack_test)
  end

  describe 'test description' do
    before :each do
      @user_one = User.create(name: 'Tadesse Alemayehu', email: 'testTadesse@gmail.com', password: '123456')
      visit new_user_session_path
      within('#new_user') do
        fill_in 'user[email]', with: @user_one.email
        fill_in 'user[password]', with: @user_one.password
      end
      click_button('commit')
    end
    it 'assert user is able to see its list of foods' do
      visit foods_path(user_id: User.first)
      expect(page).to have_content('Measurement unit')
    end
  end
end
