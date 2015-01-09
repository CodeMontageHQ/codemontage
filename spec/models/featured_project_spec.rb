require 'spec_helper'

describe FeaturedProject do
  it { should belong_to(:event) }
  it { should belong_to(:project) }

  it { should validate_uniqueness_of(:project_id).scoped_to(:event_id) }

  it { should allow_mass_assignment_of(:project_id) }
  it { should allow_mass_assignment_of(:event_id) }
end
