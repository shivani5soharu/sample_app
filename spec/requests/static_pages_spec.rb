require 'spec_helper'

describe "StaticPages" do

  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe "Home page" do

    it "should have the content 'Sample App'" do
      visit '/staticpages/home'
      page.should have_content('Sample App')
    end
    
    it "should have the title 'Home'" do
       visit '/staticpages/home'
       page.should have_selector('title', :text => "#{base_title}")
    end 

  end   

  #-------------------------

  describe "Help page" do

    it "should have content 'Help'" do
      visit '/staticpages/help'
      page.should have_content('Help')
    end
    
    it "should have the title 'Help'" do
       visit '/staticpages/help'
       page.should have_selector('title', :text => "#{base_title}")

    end  

  end 

  #-------------------------

  describe "About page" do

    it "should have content 'About Us'" do
      visit '/staticpages/about' 
      page.should have_content('About Us')
    end
   
    it "should have the title 'About Us'" do
       visit '/staticpages/about'
       page.should have_selector('title', :text => "#{base_title}")

    end   
  end

  #-------------------------

  describe "Contact page" do

    it "should have content 'Contact'" do
      visit '/staticpages/contact' 
      page.should have_content('Contact')
    end
   
    it "should have the title 'Contact'" do
       visit '/staticpages/contact'
       page.should have_selector('title', :text => "#{base_title}")

    end   
  end

end
