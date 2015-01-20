class Github

  def pull_requests_by_repo(org, repo, day_begin, day_end)
    day_begin, day_end = set_date_format(day_begin, day_end)

    results = client.search_issues "repo:#{org_repo(org, repo)} type:pr \
                                     created:#{day_begin}..#{day_end}"
    results.items
  end

  def commits_by_repo(org, repo, day_begin, day_end)
    prs = pull_requests_by_repo(org, repo, day_begin, day_end)
    commits = prs.map do |pr|
      client.pull_commits org_repo(org, repo), pr.number
    end

    commits.flatten
  end

  def issues_by_repo(org, repo, day_begin, day_end)
    day_begin, day_end = set_date_format(day_begin, day_end)

    results = client.search_issues "repo:#{org_repo(org, repo)} type:issue \
                                     created:#{day_begin}..#{day_end}"
    results.items
  end

  def forks_by_repo(repo, day_begin, day_end)
    day_begin, day_end = set_date_format(day_begin, day_end)
    results = client.search_repos "#{repo} in:name fork:only \
                                    created:#{day_begin}..#{day_end}"
    results.items
  end

  def pull_requests_by_user(user, day_begin, day_end)
    day_begin, day_end = set_date_format(day_begin, day_end)

    results = client.search_issues "author:#{user} type:pr \
                                     created:#{day_begin}..#{day_end}"
    results.items
  end

  def commits_by_user(user, day_begin, day_end)
    prs = pull_requests_by_user(user, day_begin, day_end)
    commits = prs.map do |pr|
      client.pull_commits parse_org_repo(pr.url), pr.number
    end

    commits.flatten
  end

  def issues_by_user(user, day_begin, day_end)
    day_begin, day_end = set_date_format(day_begin, day_end)

    results = client.search_issues "author:#{user} type:issue \
                                     created:#{day_begin}..#{day_end}"
    results.items
  end

  def forks_by_user(user, day_begin, day_end)
    day_begin, day_end = set_date_format(day_begin, day_end)
    results = client.search_repos "user:#{user} fork:only \
                                    created:#{day_begin}..#{day_end}"
    results.items
  end

  def get_user_login_by_uid(uid)
    user = client.user(uid.to_i)
    user.login
  end

  def org_repo(org, repo)
    "#{org}/#{repo}"
  end

  def parse_org_repo(url)
    pr_url_regex = /\Ahttps:\/\/api.github.com\/repos\/
                   ([\w\-]+)\/([\w\-]+)\/issues\/\d+\z/x
    org, repo = url.match(pr_url_regex).captures

    org_repo(org, repo)
  end

  def set_date_format(*dates)
    dates.map { |date| date.strftime("%Y-%m-%d") }
  end

  private

    def client
      @client ||= Octokit::Client.new(client_id: ENV['GITHUB_KEY'],
                                      client_secret: ENV['GITHUB_SECRET'],
                                      auto_paginate: true)
    end
end
