module Github
  module_function

  def pull_requests
    # TODO parameterize, get all pages
    results = Octokit.search_issues 'repo:empirical-org/empirical-core type:pr created:2014-10-01..2014-10-02'
    results.items
  end

  def commits
    # TODO parameterize, get all pages
    commits = pull_requests.map do |pr|
      Octokit.pull_commits 'empirical-org/empirical-core', pr.number
    end

    commits.flatten
  end
end
