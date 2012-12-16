require 'spec_helper'

describe AdminUser do
  # rspec shoulda matchers
  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:password) }
  it { should allow_mass_assignment_of(:password_confirmation) }
  it { should allow_mass_assignment_of(:remember_me) }

  before do
    @user = AdminUser.new(email: 'joe@awesomesauce.com', password: 'passw0rd', password_confirmation: 'passw0rd')
  end

  subject { @user }

  it { should respond_to(:email) }
  it { should be_valid }

  describe 'email not present' do
    before { @user.email = ' ' }
    it { should_not be_valid }
  end

  describe 'duplicate email' do
    before do 
      @user2 = AdminUser.new(email: 'joe@awesomesauce.com', password: 'passw0rd', password_confirmation: 'passw0rd')
      @user2.save
    end
    it { should_not be_valid }
  end




end
