class Sponsorship < ActiveRecord::Base
  belongs_to :organization

  attr_accessible :organization_id, :event, :tier

end
