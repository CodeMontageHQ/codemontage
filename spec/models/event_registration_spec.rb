require "spec_helper"

describe EventRegistration do
  it { should belong_to(:event) }
  it { should belong_to(:user) }

  describe "GitHub service object interactions" do
    let(:er) { create(:er_for_october) }

    describe "#github_api_args" do

      context "without github auth" do
        it "returns nil" do
          er = create(:event_registration)
          expect(er.github_api_args).to be_nil
        end
      end

      context "with github auth" do
        it "returns args", github_api: true do

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

    describe "#fetch_github_stats" do
      context "without github auth" do
        it "returns nil" do
          er = create(:event_registration)
          expect(er.fetch_github_stats).to be_nil
        end
      end

      context "with github auth" do
        it "returns GitHub stats", github_api: true do
          VCR.use_cassette("courte_oct_stats") do
            expect(er.fetch_github_stats).to eq(
              pull_requests: 1,
              commits: 1,
              issues: 0,
              forks: 2
            )
          end
        end
      end
    end
  end
end
