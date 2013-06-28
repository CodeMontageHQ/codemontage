class OrganizationMetric < ActiveRecord::Base
  belongs_to :organization

  attr_accessible :organization_id, :metric_value, :metric_label, :metric_footnote

end
