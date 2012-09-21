# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe User do

  before do
   @user = User.new(:name => "Shivani_example", :email => "shivani@example.com", :password => "mind@123", :password_confirmation => "mind@123")
   @user.save
  end      

  subject { @user }
  #checking for coloums and methods exsistance
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest)}
  it { should respond_to(:password)}
  it { should respond_to(:password_confirmation)}
  it { should respond_to(:authenticate)}
  it { should respond_to(:encrypted_password)}
  it { should be_valid}

  describe "when name is not present" do
    before {@user.name=""}
    it {should_not be_valid}
  end

  describe "when email is not present" do
    it "should not be valid" do
      @user.email=""
      @user.should_not be_valid
    end
  end
  
  describe "when password is not present" do
    before{@user.password=@user.password_confirmation=""}
    it { should_not be_valid }
  end
   
  describe "when password length is not valid" do
    it "should not allow less than 6 charcters" do
       @user.password ="a"*7
       @user.save
       should_not be_valid
    end
  end
  
  describe "when password_confirmation is not present" do
  before{@user.password_confirmation=""}
  it { should_not be_valid }
  end

  describe "when password and password_confirmation is not same" do
    before do
      @user.password="mind@123"
      @user.password_confirmation="mind@321"
    end
    it { should_not be_valid }
  end

  describe "when name length is not valid" do
  before{@user.name="s"*21}
  it{should_not be_valid}
  end
  
  describe "when email format is not valid" do
    it "should not be valid" do
      emailgroup = %w[shivani_at.com shivani@gml shi@gm+gf.com shivani_at@jk@ht.com]
      emailgroup.each do |e|
        @user.email=e
        @user.should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      emailgroup = %w[shivani@gml.com shivani@gh.co shivani@gf.COM sg34+gd@gh.org shi-vani4@hy.ju]
      emailgroup.each do |e|
        @user.email=e
        @user.should be_valid
      end
    end
  end

  describe "when email already taken and email is not case sensitive" do
    it"should not be valid" do
      @user1=User.new(:name => "shivani5", :email => "shivani@EXAMPLE.com", :password => "mind@123", :password_confirmation => "mind@123")
      @user1.save
      @user1.should_not be_valid
    end
  end
#-----------
  describe "return value of authenticate method" do
  before { @user.save }
  let(:found_user) { User.find_by_email(@user.email) }

  describe "with valid password" do
    it { should == found_user.authenticate(found_user.email,found_user.password) }
  end

  describe "with invalid password" do
    let(:user_for_invalid_password) { found_user.authenticate(found_user.email, "invalid") }

    it { should_not == user_for_invalid_password }
    specify { user_for_invalid_password.should be_false }
  end
end
#-------------  

end
