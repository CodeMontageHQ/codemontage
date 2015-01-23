require "spec_helper"

describe FeaturedProject do
  it { should belong_to(:event) }
  it { should belong_to(:project) }

  describe "validations" do
    subject { create(:featured_project) }
    it { should validate_uniqueness_of(:project_id).scoped_to(:event_id) }
  end

  it { should allow_mass_assignment_of(:project_id) }
  it { should allow_mass_assignment_of(:event_id) }

  describe "GitHub service object interactions" do
    let(:featured_project) { build(:fp_for_october) }

    it "returns arguments for GitHub API requests" do
      expect(featured_project.github_api_args).to eq(
        org_repo: "CodeMontageHQ/codemontage",
        repo: "codemontage",
        day_begin: Time.new(2014, 10, 01),
        day_end: Time.new(2014, 10, 31)
      )
    end

    it "returns GitHub stats", github_api: true do
      VCR.use_cassette("codemontage_oct_stats") do
        expect(featured_project.fetch_github_stats).to eq(
          pull_requests: 2,
          commits: 3,
          issues: 3,
          forks: 0
        )
      end
    end
  end
end
