require "spec_helper"

describe User do
  # rspec shoulda matchers
  it { should allow_mass_assignment_of(:email) }
  it { should allow_mass_assignment_of(:password) }
  it { should allow_mass_assignment_of(:remember_me) }

  it { should have_many(:event_registrations) }
  it { should have_many(:events).through(:event_registrations) }
  it { should have_many(:favorite_projects) }
  it { should have_many(:favorites).through(:favorite_projects) }
  it { should have_many(:projects).through(:favorite_projects) }
  it { should have_many(:services) }
  it { should have_one(:profile) }

  before do
    @user = User.new(email: "captain@planet.com", password: "passw0rd")
  end

  describe "with_github" do
    before do
      @user1 = create(:cm_user)
      @user2 = create(:cm_user)
      @service = @user1.services.create(provider: "github", uid: "foobar")
    end

    it "should return user who has github service" do
      expect(User.with_github).to eq([@user1])
    end
  end

  subject { @user }

  it { should respond_to(:email) }
  it { should be_valid }

  describe "email not present" do
    before { @user.email = " " }
    it { should_not be_valid }
  end

  describe "duplicate email" do
    before do
      @user2 = User.new(email: "captain@planet.com", password: "passw0rd")
      @user2.save
    end
    it { should_not be_valid }
  end

  describe "GitHub API interaction" do
    let(:user) { create(:user_with_github) }
    let(:args) do
      VCR.use_cassette("courte_user") do
        user.github_api_args.merge!(day_begin: Time.new(2014, 10, 01),
                                    day_end: Time.new(2014, 10, 31))
      end
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
          args = [:user, :day_begin, :day_end]

          VCR.use_cassette("courte_user") do
            args.each do |arg|
              expect(user.github_api_args.has_key?(arg)).to be_true
            end
          end
        end
      end
    end

    context "without github auth" do
      let(:user) { create(:user) }

      it "returns nil for pull requests" do
        expect(user.github_pull_requests).to be_nil
      end

      it "returns nil for commits" do
        expect(user.github_commits).to be_nil
      end

      it "returns nil for issues" do
        expect(user.github_issues).to be_nil
      end

      it "returns nil for forks" do
        expect(user.github_forks).to be_nil
      end
    end

    context "with github auth" do
      it "finds the user's pull requests", github_api: true do
        VCR.use_cassette("courte_oct_prs") do
          prs = user.github_pull_requests(args)
          expect(prs.count).to eq(1)
        end
      end

      it "finds the user's commits", github_api: true do
        VCR.use_cassette("courte_oct_commits") do
          commits = user.github_commits(args)
          expect(commits.count).to eq(1)
        end
      end

      it "finds the user's issues", github_api: true do
        VCR.use_cassette("courte_oct_issues") do
          issues = user.github_issues(args)
          expect(issues.count).to eq(0)
        end
      end

      it "finds the user's forks", github_api: true do
        VCR.use_cassette("courte_oct_forks") do
          forks = user.github_forks(args)
          expect(forks.count).to eq(2)
        end
      end
    end
  end
end
