require 'spec_helper'

describe Github do
  context "when given a repo" do
    it 'find pull requests' do
      VCR.use_cassette('empirical_oct_prs') do
        prs = Github.pull_requests_by_repo('empirical-org', 'empirical-core', '2014-10-01', '2014-10-02')
        expect(prs.count).to eq(7)
      end
    end

    it 'should find commits' do
      VCR.use_cassette('empirical_oct_commits') do
        commits = Github.commits_by_repo('empirical-org', 'empirical-core', '2014-10-01', '2014-10-02')
        expect(commits.count).to eq(38)
      end
    end

    it "finds issues by repo" do
      VCR.use_cassette("empirical_jan_issues") do
        issues = Github.issues_by_repo("empirical-org", "empirical-core", "2015-01-06", "2015-01-07")
        expect(issues.count).to eq(2)
      end
    end

    it "finds forks by repo" do
      VCR.use_cassette("empirical_oct_forks") do
        forks = Github.forks_by_repo("empirical-core", "2014-10-01", "2014-10-31")
        expect(forks.count).to eq(15)
      end
    end
  end

  it 'should find commits' do
    VCR.use_cassette('empirical_oct_commits') do
      commits = Github.commits('empirical-org', 'empirical-core', '2014-10-01', '2014-10-02')
      expect(commits.count).to eq(38)
    end
  end
end
