class FeaturedProject < ActiveRecord::Base
  belongs_to :project
  belongs_to :event

  validates_uniqueness_of :project_id, scope: :event_id

  attr_accessible :project_id, :event_id

  def fetch_github_stats
    args = github_api_args
    stats = {}

    stats[:pull_requests] = project.github_pull_requests(args).count
    stats[:commits]       = project.github_commits(args).count
    stats[:issues]        = project.github_issues(args).count
    stats[:forks]         = project.github_forks(args).count

    stats
  end

  def github_api_args
    project.github_api_args.merge!(event.github_api_args)
  end
end
