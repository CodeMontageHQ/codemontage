require "spec_helper"

describe Event do
  it { should have_many(:featured_projects) }
  it { should have_many(:projects).through(:featured_projects) }

  describe "#stats" do
    it "returns github stats in a hash" do
      event = create(:october)

      VCR.use_cassette("october_stats") do
        stats = event.stats
        p stats
        expect(stats).to eq(by_project:  { event.projects[0].name =>
                                            { prs: 15, issues: 34,
                                              commits: 85, forks: 14 },
                                           event.projects[1].name =>
                                            { prs: 15, issues: 34,
                                              commits: 85, forks: 14 } },
                            by_attendee: { event.users[0].email =>
                                            { prs: 1, issues: 0,
                                              commits: 1, forks: 2 },
                                           event.users[1].email =>
                                            { prs: 1, issues: 0,
                                              commits: 1, forks: 2 } },
                            total:       { prs: 2, issues: 0,
                                           commits: 2, forks: 4 })
      end
    end
  end
end
