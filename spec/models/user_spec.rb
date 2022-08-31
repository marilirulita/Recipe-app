require 'rails_helper'

RSpec.describe User, type: :model do
  describe "test User table for adding and removing user" do
    before(:all){@test_user=User.create(name: 'test user',email: "test#{rand}@gmail.com", password: '123456')}
    it "expect to add new user to user list" do
      user_cout=User.count
      @test_user.save!
      expect(user_cout+1).to eql(User.count+1)
    end
    it "expect user to be found" do
      expect(User.all).to include(@test_user)
    end
  end
end
