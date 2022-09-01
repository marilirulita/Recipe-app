require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'test user integration' do
    # before(:all){}
    it 'expect visites the login page' do
      visit new_user_session_path
      expect(page).to have_content 'Log in'
    end
  end
  describe "test description" do
      # before(:all){}
      it "test login" do
        @user_one=User.create(name: 'Tadesse Alemayehu',email: "testTadesse@gmail.com", password: '123456')
        visit new_user_session_path
        within('#new_user') do
          fill_in 'user[email]', with: 'testTadesse@gmail.com'
          fill_in 'user[password]', with: '123456'
        end
        click_button('commit')
        expect(page).to have_content('Signed in successfully.')
      end
    end
end
