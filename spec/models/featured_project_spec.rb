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

  it "returns arguments for github stats" do
    fp = create(:featured_project)
    expect(fp.github_stat_args).to eq(org: "CodeMontageHQ",
                                      repo: "codemontage",
                                      day_begin: fp.event.start_date,
                                      day_end: fp.event.end_date)
  end

  it "returns github stats in a hash" do
    fp = create(:oct_featured_project)

    VCR.use_cassette("empirical_oct_stats") do
      expect(fp.stats).to eq(prs: 15, issues: 34, commits: 85, forks: 14)
    end
  end
end
