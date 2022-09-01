require 'rails_helper'

RSpec.describe 'ShopingLists', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      puts user_shoping_lists_path(user_id: 1)
      get user_shoping_lists_path(user_id: 1)
      ## TODO: testing for redirection sense no user signed in
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
