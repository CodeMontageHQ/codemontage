require "spec_helper"

describe ProjectControllerHelper do
  
  before do
    @project = Project.create(:organization_id => 1, :name => "CodeMontage Platform", :github_repo => "codemontage", :cause_list => "Cause1, Cause2", :technology_list => "Ruby, Rails")
  end
  subject { @project }

  describe "#project_tags_link_list" do
    it "returns list of links to the technologies when type technologies is given as argument" do    
      links_list = helper.project_tags_link_list @project, 'technologies'

      expect(links_list).to include("Ruby")
      expect(links_list).to include(projects_path(:tags => "Ruby"))

      expect(links_list).to include("Rails")
      expect(links_list).to include(projects_path(:tags => "Rails"))
    end

    it "returns list of links to the technologies when type causes is given as argument" do    
      links_list = helper.project_tags_link_list @project, 'causes'
      
      expect(links_list).to include("Cause1")
      expect(links_list).to include(projects_path(:tags => "Cause1"))

      expect(links_list).to include("Cause2")
      expect(links_list).to include(projects_path(:tags => "Cause2"))
    end
  end
end
