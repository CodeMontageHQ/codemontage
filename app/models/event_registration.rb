class EventRegistration < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  attr_accessible :event_id, :user_id

  def stats
    if github_api_args
      args = github_api_args
      github_client = Github.new
      results = {}

      results[:prs]     = github_client.pull_requests_by_user(args).count
      results[:issues]  = github_client.issues_by_user(args).count
      results[:commits] = github_client.commits_by_user(args).count
      results[:forks]   = github_client.forks_by_user(args).count

      results
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
