require "spec_helper"

describe Job do
  it { should belong_to(:organization) }

  before(:each) do
    @organization = create(:organization)
    @job1 = create(:cm_job, :expire_tomorrow, organization_id: @organization.id)
    @job2 = create(:cm_job, :expired, organization_id: @organization.id)
    @job3 = create(:cm_job, organization_id: @organization.id)
  end

  describe "active scope" do
    it "should return jobs which not expires or not had expires_at field" do
      expect(Job.active).to eq([@job1, @job3])
    end
  end
end
