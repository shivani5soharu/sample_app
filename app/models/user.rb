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
  attr_accessor :password

  attr_accessible :email, :name, :password, :password_confirmation
  
  #before_save :encrypt_password  

  validates :name, :presence => true, :length => {:maximum => 20}
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, :presence => true, :format => {:with => VALID_EMAIL}, :uniqueness => {:case_sensitive => false}
  validates :password, :presence => true, :length => {:minimum => 6}
  #validates :password_confirmation, :presence => true
  validates_confirmation_of :password, :message => " "



 def authenticate(email,submitted_password)
    user = User.find_by_email(email)
    #return nil  if user.nil?
    #return user if user.has_password?(submitted_password)
    if user.password == submitted_password
      return user
    else 
      return false
    end
  end
  
=begin
  # Return true if the user's password matches the submitted password.
  def has_password?(submitted_password)
  encrypted_password == encrypt(submitted_password)
end




 private

    def encrypt_password
      self.salt = make_salt unless has_password?(password)
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end

=end

end
