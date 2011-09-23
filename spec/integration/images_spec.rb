require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

include ImagesHelper

# ===============
# /images
# ===============
describe "/images INDEX" do
  
  before(:each) do
    visit "/images"
  end
  
  it "should respond successfully" do
    response.should be_successful
  end
  
  it "should show the navigation bar" do
    response.should have_selector('div', :id => 'topbar')
  end
  
  it "should have a polaroids section" do
    response.should have_selector('ul', :class => 'polaroids')
  end
end

# ===============
# /images/:id
# ===============
describe "/images/1" do
  
  before(:each) do
    @image = Image.find(1)
  end
  
  describe "GET" do
    
    before(:each) do
      visit "/images/1"
    end
    
    it "should respond successfully" do
      response.should be_successful
    end
    
    it "should show the navigation bar" do
      response.should have_selector('div', :id => 'topbar')
    end
    
    it "should contain the requested image" do
      response.should have_selector('img', :src => @image.url)
    end
    
    it "should show the image score block" do
      response.should have_selector('div', :id => 'score-block')
    end
    
    it "should show a tweet button" do
      response.should have_selector('script', :src  => 'http://platform.twitter.com/widgets.js')
      response.should have_selector('a',  :href   => 'http://twitter.com/share',
                                          :class  => 'twitter-share-button')
    end
    
    describe "score block" do
      
      it "should show the overall rating" do
        response.should contain("Overall rating:")
      end
      
      it "should show the top rating" do
        response.should contain("Jacket/Shirt(s) rating:")
      end
      
      it "should show the pants rating" do
        response.should contain("Pants rating:")
      end
      
      it "should show the shoes rating" do
        response.should contain("Shoes rating:")
      end
      
      it "should show the accessories rating" do
        response.should contain("Accessories rating:")
      end
    end
  end
end