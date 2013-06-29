class Project < ActiveRecord::Base
  belongs_to :organization
  acts_as_ordered_taggable
  acts_as_ordered_taggable_on :technologies, :causes
  
  attr_accessible :organization_id, :name, :github_repo, :description, :notes, :cause_list, :technology_list

  has_many :favorite_projects
  has_many :users, :through => :favorite_projects

  scope :featured, where("organization_id IS NOT NULL")
  
  def github_url
    github_url = self.organization.github_url + "/" + self.github_repo
  end  

  def related_projects
    projects = self.organization.projects.where("id NOT IN (?)", self.id)
  end

end
