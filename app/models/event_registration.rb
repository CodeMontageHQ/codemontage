class EventRegistration < ActiveRecord::Base
  belongs_to :event
  belongs_to :user

  attr_accessible :event_id, :user_id

  def stats
    if github_stat_args
      args = github_stat_args
      github_client = Github.new
      results = {}

      results[:prs]     = github_client.pull_requests_by_user(
                            args[:user],
                            args[:day_begin],
                            args[:day_end]
                          ).count

      results[:issues]  = github_client.issues_by_user(
                            args[:user],
                            args[:day_begin],
                            args[:day_end]
                          ).count

      results[:commits] = github_client.commits_by_user(
                            args[:user],
                            args[:day_begin],
                            args[:day_end]
                          ).count

      results[:forks]   = github_client.forks_by_user(
                            args[:user],
                            args[:day_begin],
                            args[:day_end]
                          ).count

      results
    else
      nil
    end
  end

  def github_stat_args
    if user.has_github
      uid = user.services.find_by_provider(:github).uid

      { user:      Github.new.get_user_login_by_uid(uid),
        day_begin: event.start_date,
        day_end:   event.end_date }
    else
      nil
    end
  end
end
