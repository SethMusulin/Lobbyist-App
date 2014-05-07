require 'spec_helper'


describe 'users' do
  it "model does not allow user name to be blank " do
    user = User.create!(:email => 'mike@example.com', :password => "12345", :password_confirmation => "12345")
    user.email = ""
    expect(user).to_not be_valid
  end

  it "model does not allow an improper password" do
    user = User.create!(:email => 'mike@example.com', :password => "12345", :password_confirmation => "12345")
    user.password_digest = ""
    expect(user).to_not be_valid
  end
  it "model does not allow duplicate emails" do
    user = User.create!(:email => 'mike@example.com', :password => "12345", :password_confirmation => "12345")
    user_2 = User.create!(:email => 'miket@example.com', :password => "12345", :password_confirmation => "12345")
    user_2.email = 'mike@example.com'
    expect(user_2).to_not be_valid
  end
end
