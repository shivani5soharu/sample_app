require 'spec_helper'

describe "UserPages" do
  subject {page}

  describe "singup page" do
    before {visit signup_path}
    
    let(:submit){"Create my account"}
    
    describe "with invalid information" do

      it "should not create a user when no information entered" do
        expect{click_button submit}.not_to change(User, :count)
      end

      before do
        fill_in "Name", :with => "shivani"
        fill_in "Email", :with => "shivani.com"
        fill_in "Password", :with => "mind@123"
        fill_in "Confirmation", :with => "mind@123"
      end

      it "should not create a user when invalid information entered" do
        expect{click_button submit}.not_to change(User, :count)
      end
   
      describe "After submission" do
        before { click_button submit }

          it{ should have_selector('title', :text => "Sign up") }
          it{ should have_content('error') }
      end

    end

     describe "with valid information" do
      before do
        fill_in "Name", :with => "shivani"
        fill_in "Email", :with => "shivani@gmal.com"
        fill_in "Password", :with => "mind@123"
        fill_in "Confirmation", :with => "mind@123"
      end
      it "should create a user" do
        expect{click_button submit}.to change(User, :count).by(1)
      end
    end

  end  

end
