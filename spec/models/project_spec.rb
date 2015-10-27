require "spec_helper"

describe Project do
  it { should belong_to(:organization) }
  it { should have_many(:featured_projects) }
  it { should have_many(:events).through(:featured_projects) }
  it { should have_many(:favorite_projects) }
  it { should have_many(:users).through(:favorite_projects) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:github_repo) }

  context "scopes" do
    before(:each) do
      @organization = create(:cm_organization)
      @project1 = create(:cm_project, organization_id: @organization.id)
      @project2 = create(:cm_project, :inactive, organization_id: @organization.id)
      @project3 = create(:cm_project, :approved, organization_id: @organization.id)
    end

    describe "approved scope" do
      it "should return only approved project" do
        expect(Project.approved).to eq([@project3])
      end
    end

    describe "active scope" do
      it "should return only approved & active project" do
        expect(Project.active).to eq([@project3])
      end
    end

    describe "featured scope" do
      it "should return only active project which has organization_id" do
        expect(Project.featured).to eq([@project3])
      end
    end
  end

  context "github-related methods" do
    let(:project) { Project.new }
    let(:organization) do
      double(github_org: "codemontage", github_url: "https://github.com/codemontage")
    end

    before do
      project.stub(:organization) { organization }
      project.stub(:github_repo) { "foo" }
    end

    describe "#github_display" do
      it "creates an organization/repo string" do
        expect(project.github_display).to eq("codemontage/foo")
      end
    end

    describe "#github_url" do
      it "creates a repo url" do
        expect(project.github_url).to eq("https://github.com/codemontage/foo")
      end
    end

    describe "#tasks_url" do
      it "creates an issues url" do
        expect(project.tasks_url).to eq("https://github.com/codemontage/foo/issues")
      end
    end
  end

  describe "GitHub API interaction" do
    let(:project) { build(:project) }
    let(:args) do
      project.github_api_args.merge!(day_begin: Time.new(2014, 10, 01),
                                     day_end: Time.new(2014, 10, 31))
    end

    describe "#github_api_args" do
      it "returns basic arguments for the GitHub service object" do
        args = [:org_repo, :repo, :day_begin, :day_end]

        args.each do |arg|
          expect(project.github_api_args.has_key?(arg)).to be_true
        end
      end
    end

    it "finds pull requests", github_api: true do
      VCR.use_cassette("codemontage_oct_prs") do
        prs = project.github_pull_requests(args)
        expect(prs.count).to eq(2)
      end
    end

    it "finds commits", github_api: true do
      VCR.use_cassette("codemontage_oct_commits") do
        commits = project.github_commits(args)
        expect(commits.count).to eq(3)
      end
    end

    it "finds issues by repo", github_api: true do
      VCR.use_cassette("codemontage_oct_issues") do
        issues = project.github_issues(args)
        expect(issues.count).to eq(3)
      end
    end

    it "finds forks by repo", github_api: true do
      VCR.use_cassette("codemontage_oct_forks") do
        forks = project.github_forks(args)
        expect(forks.count).to eq(0)
      end
    end
  end

  describe "#related_projects" do
    let(:organization) { create(:cm_organization) }

    before do
      @project_1 = create(:cm_project, organization_id: organization.id)
      @project_2 = create(:cm_project, organization_id: organization.id)
    end

    it "returns its organization's other projects" do
      expect(@project_1.related_projects).to eq([@project_2])
    end
  end
end
