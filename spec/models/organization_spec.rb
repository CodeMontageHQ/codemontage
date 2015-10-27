require "spec_helper"

describe Organization do
  it { should have_many(:organization_metrics) }
  it { should have_many(:projects) }
  it { should have_many(:jobs) }
  it { should have_many(:sponsorships) }
  it { should validate_presence_of(:name) }

  context "validations" do
    context "if public submission" do
      before { subject.stub(:is_public_submission) { true } }
      it { should validate_presence_of(:github_org) }
    end

    context "if not public submission" do
      before { subject.stub(:is_public_submission) { false } }
      it { should_not validate_presence_of(:github_org) }
    end

    context "if not public submission, implicit" do
      it { should_not validate_presence_of(:github_org) }
    end
  end

  context "scopes" do
    before(:each) do
      @organization1 = create(:cm_organization, name: "Spritle")
      @organization2 = create(:cm_organization, name: "Foo")
      @project1 = create(:cm_project, organization_id: @organization1.id)
      @project2 = create(:cm_project, :inactive, organization_id: @organization1.id)
      @project3 = create(:cm_project, :approved, organization_id: @organization1.id)
      @job = create(:cm_job, organization_id: @organization1.id)
    end

    describe "approved scope" do
      it "should return all organization which has approved projects" do
        expect(Organization.approved).to eq([@organization1])
      end
    end

    describe "featured scope" do
      it "should return organizations which has approved & active projects" do
        expect(Organization.featured).to eq([@organization1])
      end
    end

    describe "hiring scope" do
      it "should return all organization which has jobs" do
        expect(Organization.hiring).to eq([@organization1])
      end
    end
  end

  context "url wrangling" do
    let(:organization) do
      Organization.new(url: "http://www.amazing.org", github_org: "amazing")
    end

    describe "#display_url" do
      it "returns the hostname of its url" do
        expect(organization.display_url).to eq("www.amazing.org")
      end

      it "returns an empty string if its url is missing" do
        organization.stub(url: nil)
        expect(organization.display_url).to eq("")
      end
    end

    describe "#github_url" do
      it "concatentates its github url" do
        expect(organization.github_url).to eq("https://github.com/amazing")
      end

      it "returns an empty string if it has no github org" do
        organization.stub(github_org: nil)
        expect(organization.github_url).to be_nil
      end
    end
  end

  context "logo deletion" do
    let(:organization) { Organization.new }
    let(:logo) { double }

    before do
      organization.stub(:logo) { logo }
    end

    describe "#logo_delete" do
      it "defaults its logo_delete flag" do
        expect(organization.logo_delete).to eq("0")
      end
    end

    describe "#logo_delete=" do
      it "sets its logo_delete flag" do
        organization.logo_delete = "foo"
        expect(organization.logo_delete).to eq("foo")
      end
    end

    describe "#delete_logo" do
      it "clears its logo if its logo_delete flag is set to 1" do
        organization.stub(:logo_delete) { "1" }
        logo.should_receive(:clear)
        organization.send(:delete_logo)
      end
      it "does not clear its logo if its logo_delete flag is not set to 1" do
        organization.stub(:logo_delete) { nil }
        logo.should_not_receive(:clear)
        organization.send(:delete_logo)
      end
    end
  end
end
