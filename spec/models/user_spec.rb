require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'test User table for adding and removing user' do
    before(:all) { @test_user = User.new(name: 'test user', email: "test#{rand}@gmail.com", password: '123456') }
    it 'expect to add new user to user list' do
      user_cout = User.count
      puts "user count is #{user_cout}"
      @test_user.save!
      puts "user count is #{user_cout}"
      expect(user_cout + 1).to eql(User.count)
    end
    it 'expect user to be found' do
      @test_save = User.new(name: 'test user', email: "test#{rand}@gmail.com", password: '123456')
      @test_save.save!
      expect(User.where(id: @test_save.id).length).to eql(1)
    end
  end
end
