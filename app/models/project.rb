class Project < ActiveRecord::Base
  belongs_to :organization
  
  attr_accessible :organization_id, :name, :github_repo, :description, :notes
  
end
