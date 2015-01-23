require "spec_helper"

describe EventRegistration do
  it { should belong_to(:event) }
  it { should belong_to(:user) }

  describe "#github_api_args" do

    context "without github auth" do
      it "returns nil" do
        er = create(:event_registration)
        expect(er.github_api_args).to be_nil
      end
    end

    context "with github auth" do
      it "returns args", github_api: true do
        er = create(:er_for_october)

        VCR.use_cassette("courte_user") do
          expect(er.github_api_args).to eq(
            user: "courte",
            day_begin: Time.new(2014, 10, 01),
            day_end: Time.new(2014, 10, 31)
          )
        end
      end
    end
  end

  describe "#stats" do
    context "without github auth" do
      it "returns nil" do
        er = create(:event_registration)
        expect(er.stats).to be_nil
      end
    end

    context "with github auth" do
      it "returns metrics in a hash", github_api: true do
        er = create(:er_for_october)

        VCR.use_cassette("courte_er_stats") do
          expect(er.stats).to eq(prs: 1, issues: 0, commits: 1, forks: 2)
        end
      end
    end
  end
end
