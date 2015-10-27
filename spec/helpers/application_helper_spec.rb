require "spec_helper"

describe ApplicationHelper do
  describe "#display_url" do
    it "returns the domain portion of a given url" do
      expect(helper.display_url("http://www.foo.com/bar/12")).
        to eq("www.foo.com/bar/12")
    end
  end

  context "logo retrieval" do
    let(:organization) { Organization.new }
    let(:logo) { double }

    describe "#find_logo" do
      it "returns an organization's attached logo if it exists" do
        organization.stub(:logo) { logo }
        logo.should_receive(:url).with(:medium)
        helper.find_logo(organization)
      end

      it "returns an organizations's image_url if no attached logo exists" do
        organization.stub(:logo) { nil }
        organization.stub(:image_url) { "foo.png" }
        expect(helper.find_logo(organization)).to eq("foo.png")
      end
    end

    describe "#find_logo?" do
      it "returns true if an organization has a logo attachment" do
        organization.stub(:logo) { "something" }
        organization.stub(:image_url) { nil }
        expect(helper.find_logo?(organization)).to be_true
      end

      it "returns true if an organization has an image_url defined" do
        organization.stub(:logo) { nil }
        organization.stub(:image_url) { "foo.png" }
        expect(helper.find_logo?(organization)).to be_true
      end

      it "returns false if neither logo nor image_url are present" do
        organization.stub(:logo) { nil }
        organization.stub(:image_url) { nil }
        expect(helper.find_logo?(organization)).to be_false
      end
    end
  end

  describe "#twitter_url" do
    it "returns twitter url for given non nil handle" do
      helper.twitter_url("CodeMontage").
        should eq("http://twitter.com/CodeMontage")
    end

    it "returns nil when nil is given" do
      helper.twitter_url(nil).should eq(nil)
    end
  end
end
