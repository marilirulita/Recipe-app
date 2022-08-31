require 'rails_helper'

RSpec.describe 'Users', type: :system do
  describe 'test user integration' do
    # before(:all){}
    it 'expect visites the login page' do
      visit new_user_session_path
      expect(page).to have_content 'Log in'
    end
  end
end
