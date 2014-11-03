require 'spec_helper'

describe Github do
  it 'find pull requests' do
    VCR.use_cassette('empirical_oct_prs') do
      prs = Github.pull_requests
      expect(prs.count).to eq(7)
    end
  end

  it 'should find commits' do
    VCR.use_cassette('empirical_oct_commits') do
      commits = Github.commits
      expect(commits.count).to eq(38)
    end
  end
end
