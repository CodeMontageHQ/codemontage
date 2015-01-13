class FeaturedProject < ActiveRecord::Base
  belongs_to :project
  belongs_to :event

  validates_uniqueness_of :project_id, scope: :event_id

  attr_accessible :project_id, :event_id

  def stats
    args = {}
    args[:org] = project.organization.github_org
    args[:repo] = project.github_repo
    args[:day_begin] = event.start_date
    args[:day_end] = event.end_date

    results = {}
    results[:prs]     = Github.pull_requests_by_repo(args[:org], args[:repo],
                                                      args[:day_begin],
                                                      args[:day_end]).count

    results[:issues]  = Github.issues_by_repo(args[:org], args[:repo],
                                              args[:day_begin],
                                              args[:day_end]).count

    results[:commits] = Github.commits_by_repo(args[:org], args[:repo],
                                               args[:day_begin],
                                               args[:day_end]).count

    results[:forks]   = Github.forks_by_repo(args[:repo], args[:day_begin],
                                             args[:day_end]).count

    results
  end
end
