require "spec_helper"

describe ApplicationHelper do
  
  describe "#twitter_url" do
    it "returns twitter url for given non nil handle" do    
      helper.twitter_url("CodeMontage").should eq("http://twitter.com/CodeMontage")
    end

    it "returns nil when nil is given" do    
      helper.twitter_url(nil).should eq(nil)
    end
  end
end
