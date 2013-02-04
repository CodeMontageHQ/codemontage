class Project < ActiveRecord::Base
  belongs_to :organization
  
  attr_accessible :organization_id, :name, :github_repo, :description, :notes
  
  def github_url
    github_url = "http://github.com/" + self.organization.github_org + "/" + self.github_repo
  end  

  def related_projects
    projects = self.organization.projects.where("id NOT IN (?)", self.id)
  end

end
