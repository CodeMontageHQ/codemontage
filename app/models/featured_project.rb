class FeaturedProject < ActiveRecord::Base
  belongs_to :project
  belongs_to :event

  validates_uniqueness_of :project_id, scope: :event_id
end
