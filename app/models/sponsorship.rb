class Sponsorship < ActiveRecord::Base
  belongs_to :organization
  belongs_to :event

  attr_accessible :organization_id, :event_id, :tier
end
