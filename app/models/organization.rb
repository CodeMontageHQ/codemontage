class Organization < ActiveRecord::Base
  has_many :projects
  
  attr_accessible :name, :url, :github_org, :description, :is_tax_exempt, :contact_name, :contact_role, :contact_email, :annual_budget_usd, :total_staff_size, :tech_staff_size, :notes, :image_url
  
end
