class Project < ActiveRecord::Base
  belongs_to :organization
  acts_as_ordered_taggable
  acts_as_ordered_taggable_on :technologies, :causes

  attr_accessible :organization_id, :name, :url, :github_repo, :description, :notes, :cause_list, :technology_list, :is_active, :is_approved
  validates_presence_of :name, :github_repo

  has_many :favorite_projects
  has_many :users, :through => :favorite_projects

  include FriendlyId
  friendly_id :name, use: :slugged

  scope :approved, where(:is_approved => true)
  scope :active, approved.where(:is_active => true)
  scope :featured, where("organization_id IS NOT NULL").active
  scope :with_technologies_and_causes, includes(:technologies, :causes)
  scope :with_organization, includes(:organization)

  def github_display
    "#{self.organization.github_org}/#{self.github_repo}"
  end

  def github_url
    "#{self.organization.github_url}/#{self.github_repo}"
  end

  def related_projects
    self.organization.projects.where("id != ?", self.id)
  end

  def tasks_url
    "#{github_url}/issues"
  end

end
