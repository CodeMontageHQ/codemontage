require 'spec_helper'

describe User do
  # rspec shoulda matchers
  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:password) }
  it { should allow_mass_assignment_of(:remember_me) }

  before do
    @user = User.new(email: 'captain@planet.com', password: 'passw0rd')
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
      @user2 = User.new(email: 'captain@planet.com', password: 'passw0rd')
      @user2.save
    end
    it { should_not be_valid }
  end

  describe "#github_api_args" do
    context "without github auth" do
      it "returns nil" do
        user = create(:user)
        expect(user.github_api_args).to be_nil
      end
    end

    context "with github auth" do
      it "returns args", github_api: true do
        user = create(:user_with_github)
        args = [:user, :day_begin, :day_end]

        VCR.use_cassette("courte_user") do
          args.each do |arg|
            expect(user.github_api_args.has_key?(arg)).to be_true
          end
        end
      end
    end
  end
end
