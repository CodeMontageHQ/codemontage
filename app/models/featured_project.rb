class FeaturedProject < ActiveRecord::Base
  belongs_to :project
  belongs_to :event

  validates_uniqueness_of :project_id, scope: :event_id

  attr_accessible :project_id, :event_id

  def github_api_args
    project.github_api_args.merge!(day_begin: event.start_date,
                                   day_end: event.end_date)
  end
end
