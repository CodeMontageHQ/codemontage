require "spec_helper"

describe OrganizationMetric do
  it { should belong_to(:organization) }
end
