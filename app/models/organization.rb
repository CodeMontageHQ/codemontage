class Organization < ActiveRecord::Base
  has_many :jobs
  has_many :projects
  has_many :organization_metrics
  has_many :sponsorships

  attr_accessible :name, :url, :github_org, :description, :is_tax_exempt, :contact_name, :contact_role, :contact_email, :annual_budget_usd, :total_staff_size, :tech_staff_size, :notes, :image_url, :twitter
  attr_accessible :organization_metrics_attributes, :projects_attributes

  accepts_nested_attributes_for :organization_metrics, :projects

  include FriendlyId
  friendly_id :name, use: :slugged

  scope :featured, where(Project.active.where("organization_id = organizations.id").exists).order("name")
  scope :hiring, where(Job.where("organization_id = organizations.id").exists).order("name")
  scope :sponsors, Organization.joins(:sponsorships).order("sponsorships.tier, organizations.name")

  def display_url
    display_url = self.url.gsub(/^https?:\/\//,"")
  end

  def github_url
    github_url = ("http://github.com/" + self.github_org) unless self.github_org.blank?
  end

  def twitter_url
    twitter_url = ("http://twitter.com/" + self.twitter) unless self.twitter.blank?
  end
  
end
