require "spec_helper"

describe Event do
  it { should have_many(:featured_projects) }
  it { should have_many(:projects).through(:featured_projects) }
end
