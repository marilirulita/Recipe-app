require 'rails_helper'

RSpec.describe @recipe, type: :model do
  describe 'validations' do
    before(:all) do
      @user = User.new(name: 'Mar', email: 'mar@email.com', password: '123456')
      @recipe = Recipe.new(name: 'Soup', preparation_time: '15', cooking_time: '45',
                           description: 'Soupe description...', public: true, user: @user)
    end

    it 'name should be present' do
      @recipe.name = nil
      expect(@recipe).to_not be_valid
    end

    it 'preparation time should be present' do
      @recipe.preparation_time = nil
      expect(@recipe).to_not be_valid
    end

    it 'cooking time should be present' do
      @recipe.cooking_time = nil
      expect(@recipe).to_not be_valid
    end

    it 'description should be present' do
      @recipe.description = nil
      expect(@recipe).to_not be_valid
    end

    it 'public selection should be present' do
      @recipe.public = nil
      expect(@recipe).to_not be_valid
    end

    it 'user asigned should be present' do
      @recipe.user_id = nil
      expect(@recipe).to_not be_valid
    end
  end
end
