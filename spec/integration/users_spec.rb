require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include UsersHelper

# ===============
# /users/new
# ===============
describe "/users/new" do
  describe "GET" do
    before(:each) do
      visit "/users/new"
    end
    
    it "should respond successfully" do
      response.should be_success
    end
  end
end