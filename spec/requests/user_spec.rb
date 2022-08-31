require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'redirects to the login page' do
      get users_path
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
