require 'spec_helper'

describe Organization do
  it { should have_many(:organization_metrics) }
  it { should have_many(:projects) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:github_org) }

  context "if by admin" do
    before { 
      @organization = Organization.new
      @organization.by_admin = true
     }
    subject { @organization }
    it { should_not validate_presence_of(:github_org) }
  end
end
