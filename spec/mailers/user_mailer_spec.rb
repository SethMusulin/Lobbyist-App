require 'spec_helper'

describe UserMailer do
  describe 'new user is created' do
    let :user do
      User.create!(email: "new-user@example.com", password: "password1", password_confirmation: "password1")
    end
    let(:welcome_message) { UserMailer.welcome_email(user) }

    it 'comes from the proper user' do
      expect(welcome_message.from).to eq ["notifications@g2-social-network.com"]
    end

    it 'goes to the proper user' do
      expect(welcome_message.to).to eq ["new-user@example.com"]
    end

    it 'has the proper subject' do
      expect(welcome_message.subject).to eq "Welcome to Lobb"
    end
  end
end