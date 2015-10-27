require "spec_helper"

describe ProjectControllerHelper do
  describe "#code_later_url" do
    let(:url) { helper.code_later_url }

    before do
      Date.stub(:tomorrow) { Date.parse("1971/12/17") }
    end

    it "returns a url with a start date parameter of tomorrow at 2pm" do
      url = helper.code_later_url
      expected = "19711217T140000Z"
      expect(url.include?(expected)).to be_true
    end

    it "returns a url with an end date parameter of tomorrow at 6pm" do
      url = helper.code_later_url
      expected = "19711217T180000Z"
      expect(url.include?(expected)).to be_true
    end
  end

  describe "#project_tags_link_list" do
    let(:project) do
      Project.new(
        organization_id: 1,
        name: "CodeMontage Platform",
        github_repo: "codemontage"
      )
    end

    before do
      project.stub(:causes) do
        [double("Tag", name: "Cause1"), double("Tag", name: "Cause2")]
      end
      project.stub(:technologies) do
        [double("Tag", name: "Ruby"), double("Tag", name: "Rails")]
      end
    end

    context "given a technologies argument" do
      let(:links_list) do
        helper.project_tags_link_list(project, "technologies")
      end

      it "returns a list of technology links" do
        expect(links_list).to include("Ruby")
        expect(links_list).to include("Rails")
        expect(links_list).to include(projects_path(tags: "Ruby"))
        expect(links_list).to include(projects_path(tags: "Rails"))
      end
    end

    context "given a causes argument" do
      let(:links_list) { helper.project_tags_link_list(project, "causes") }

      it "returns a list of cause links" do
        expect(links_list).to include("Cause1")
        expect(links_list).to include("Cause2")
        expect(links_list).to include(projects_path(tags: "Cause1"))
        expect(links_list).to include(projects_path(tags: "Cause2"))
      end
    end
  end
end
