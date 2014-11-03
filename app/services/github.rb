module Github
  module_function

  def pull_requests(org, repo, day_begin, day_end)
    # TODO get all pages
    results = Octokit.search_issues "repo:#{org_repo(org, repo)} type:pr created:#{day_begin}..#{day_end}"
    results.items
  end

  def commits(org, repo, day_begin, day_end)
    # TODO get all pages
    prs = pull_requests(org, repo, day_begin, day_end)
    commits = prs.map do |pr|
      Octokit.pull_commits org_repo(org, repo), pr.number
    end

    commits.flatten
  end

  def org_repo(org, repo)
    "#{org}/#{repo}"
  end
end
