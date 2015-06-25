require 'rails_helper'

RSpec.describe User, :type => :model do
  context "User creation" do
    it "- does not sign up user with invalid credentials" do
      @user = User.new
      expect(@user.save).to eq false
      @user = User.new({:username => 'username'})
      expect(@user.save).to eq false
      @user = User.new({:username => 'username', :password => 'tiny', :password_confirmation => 'tiny'})
      expect(@user.save).to eq false
      @user = User.new({:username => 'username', :password => 'tiny', :password_confirmation => 'diff'})
      expect(@user.save).to eq false
    end

    it "- signs up user with valid credentials" do
      @user = User.new({:username => 'username1', :password => 'not_short', :password_confirmation => 'not_short'})
      expect(@user.save).to eq true
      @user = User.new({:username => 'username2', :password => 'not_short'})
      expect(@user.save).to eq true
    end
  end

  context "User authentication" do
    it "- logs in user with valid credentials" do
      @user = User.new({:username => 'username3', :password => 'not_short'})
      expect(@user.save).to eq true
      expect(@user.authenticate('not_short')).to be_a User
    end

    it "- does not log in user with invalid credentials" do
      @user = User.new({:username => 'username4', :password => 'not_short'})
      expect(@user.save).to eq true
      expect(@user.authenticate('not_the_same')).to eq false
    end
  end
end
