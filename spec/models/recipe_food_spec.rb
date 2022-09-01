require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  describe 'validations' do
    before(:each) do
      @user = User.new(name: 'Mar', email: 'mar@email.com', password: '123456')
      @recipe = Recipe.new(name: 'Soup', preparation_time: '15', cooking_time: '45',
                           description: 'Soupe description...', public: true, user: @user)
      @food = Food.create(name: 'Vegetables', measurement_unit: 'gr', price: 2, user: @user)
      @recipe_food = RecipeFood.create(recipe: @recipe, food: @food, quantity: 1)
    end

    it 'recipe_id should be present' do
      @recipe_food.recipe_id = nil
      expect(@recipe_food).to_not be_valid
    end

    it 'food_id should be present' do
      @recipe_food.food_id = nil
      expect(@recipe_food).to_not be_valid
    end

    it 'quantity should be present' do
      @recipe_food.quantity = nil
      expect(@recipe_food).to_not be_valid
    end
  end
end
