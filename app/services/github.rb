module Github
  module_function

  def pull_requests_by_repo(org, repo, day_begin, day_end)
    Octokit.auto_paginate = true
    results = Octokit.search_issues "repo:#{org_repo(org, repo)} type:pr created:#{day_begin}..#{day_end}"
    results.items
  end

  def commits_by_repo(org, repo, day_begin, day_end)
    prs = pull_requests_by_repo(org, repo, day_begin, day_end)
    commits = prs.map do |pr|
      Octokit.pull_commits org_repo(org, repo), pr.number
    end

    commits.flatten
  end

  def org_repo(org, repo)
    "#{org}/#{repo}"
  end
end
