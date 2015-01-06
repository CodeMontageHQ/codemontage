class FeaturedProject < ActiveRecord::Base
  belongs_to :project
  belongs_to :event

  attr_accessible :project_id, :event_id
end
