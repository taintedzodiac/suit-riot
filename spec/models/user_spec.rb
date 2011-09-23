require 'spec_helper'

describe User do
  
  describe "a valid user" do
    
    before :each do
      @user = Factory.create(:valid_user)
    end
  
    it "should be valid when new" do
      @user.should be_valid
    end
    
    it "should require an email address" do
      @user.email = ""
      @user.should_not be_valid
    end
    
    it "should require a login name" do
      @user.login = ""
      @user.should_not be_valid
    end
  end
  
  describe "an invalid user" do
    
    before :each do
      @user = Factory.build(:invalid_user)
    end
    
    it "should be invalid" do
      @user.should_not be_valid
    end
  end
end
