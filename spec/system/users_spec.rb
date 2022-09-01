require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'test user integration' do
    # before(:all){}
    it 'expect visites the login page' do
      visit new_user_session_path
      expect(page).to have_content 'Log in'
    end
  end
  describe 'Test user signup and sign in functions' do
    before(:all) do
      @user_one = User.create(name: 'Tadesse Alemayehu', email: 'testTadesse@gmail.com', password: '123456')
    end
    it 'Test login' do
      visit new_user_session_path
      within('#new_user') do
        fill_in 'user[email]', with: @user_one.email
        fill_in 'user[password]', with: @user_one.password
      end
      click_button('commit')
      expect(page).to have_content('Signed in successfully.')
    end
    it 'Test user signup' do
      visit new_user_registration_path
      within('#new_user') do
        fill_in 'user[name]', with: 'testsignup@gmail.com'
        fill_in 'user[email]', with: 'testsignup@gmail.com'
        fill_in 'user[password]', with: '123456'
        fill_in 'user[password_confirmation]', with: '123456'
      end
      click_button('commit')
      expect(page).to have_content('Welcome! You have signed up successfully.')
    end
  end
  describe 'Test Home page contents' do
    before :each do
      @user_one = User.create(name: 'Tadesse Alemayehu', email: 'testTadesse@gmail.com', password: '123456')
      visit new_user_session_path
      within('#new_user') do
        fill_in 'user[email]', with: @user_one.email
        fill_in 'user[password]', with: @user_one.password
      end
      click_button('commit')
    end
    it 'Expect user visit the right home page' do
      expect(page).to have_content('User Home page')
    end
  end
end
