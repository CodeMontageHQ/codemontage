class Project < ActiveRecord::Base
  belongs_to :organization
  acts_as_ordered_taggable
  acts_as_ordered_taggable_on :technologies, :causes
  
  attr_accessible :organization_id, :name, :github_repo, :description, :notes, :cause_list, :technology_list, :is_active

  has_many :favorite_projects
  has_many :users, :through => :favorite_projects
  
  scope :active, where(:is_active => true)
  scope :featured, where("organization_id IS NOT NULL").active
  
  def github_display
    github_display = self.organization.github_org + "/" + self.github_repo
  end

  def github_url
    github_url = self.organization.github_url + "/" + self.github_repo
  end  

  def related_projects
    projects = self.organization.projects.where("id NOT IN (?)", self.id)
  end

end
