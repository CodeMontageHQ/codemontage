require "spec_helper"

describe Project do
  it { should belong_to(:organization) }
  it { should have_many(:featured_projects) }
  it { should have_many(:events).through(:featured_projects) }

  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:submitted_github_url).on(:create) }
  it { should validate_presence_of(:github_repo).on(:update) }

  context 'github-related methods' do
    let(:project) { Project.new }
    let(:organization) { double(github_org: 'codemontage', github_url: 'https://github.com/codemontage') }

    before do
      project.stub(:organization) { organization }
      project.stub(:github_repo) { 'foo' }
    end

    describe '#github_display' do
      it 'creates an organization/repo string' do
        expect(project.github_display).to eq('codemontage/foo')
      end
    end

    describe '#github_url' do
      it 'creates a repo url' do
        expect(project.github_url).to eq('https://github.com/codemontage/foo')
      end
    end

    describe '#tasks_url' do
      it 'creates an issues url' do
        expect(project.tasks_url).to eq('https://github.com/codemontage/foo/issues')
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

  describe '#related_projects' do
    let(:organization) { Organization.create!(name: 'CodeMontage') }

    before do
      @project_1 = Project.create!(name: 'Code Montage', organization_id: organization.id, submitted_github_url: 'https://github.com/CodeMontageHQ/codemontage')
      @project_2 = Project.create!(name: 'Happy Days', organization_id: organization.id, submitted_github_url: 'https://github.com/kig/happydays')
    end

    it "returns its organization's other projects" do
      expect(@project_1.related_projects).to eq([@project_2])
    end
  end

  describe '.parse_git_url' do
    it "returns organization/repo given a github project url" do
      expect(Project.parse_git_url('https://github.com/CodeMontageHQ/codemontage')).to eq('CodeMontageHQ/codemontage')
    end
  end
end
