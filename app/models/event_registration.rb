class EventRegistration < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  attr_accessible :event_id, :user_id

  def fetch_github_stats
    if github_api_args
      args = github_api_args
      stats = {}

      stats[:pull_requests] = user.github_pull_requests(args).count
      stats[:issues]        = user.github_issues(args).count
      stats[:commits]       = user.github_commits(args).count
      stats[:forks]         = user.github_forks(args).count

      stats
    else
      nil
    end
  end

  def github_api_args
    if user.github_api_args
      user.github_api_args.merge!(day_begin: event.start_date,
                                  day_end: event.end_date)
    else
      nil
    end
  end
end
