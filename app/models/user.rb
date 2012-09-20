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

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  
  before_save {|user| user.email = email.downcase}   

  validates :name, :presence => true, :length => {:maximum => 20}
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :format => {:with => VALID_EMAIL}, :uniqueness => {:case_sensitive => false}
  validates :password, :presence => true
  #validates :password_confirmation, :presence => true
  validates_confirmation_of :password, :message => " "
end
