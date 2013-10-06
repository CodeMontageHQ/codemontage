class Organization < ActiveRecord::Base
  has_many :projects
  has_many :organization_metrics
  
  attr_accessible :name, :url, :github_org, :description, :is_tax_exempt, :contact_name, :contact_role, :contact_email, :annual_budget_usd, :total_staff_size, :tech_staff_size, :notes, :image_url, :twitter, :logo
  attr_accessible :organization_metrics_attributes

  #Paperclip
  has_attached_file :logo, :styles => { :thumb => "100x100>", :medium => "250x250>" }
  validates_attachment_size :logo, :less_than => 5.megabytes
  validates_attachment_content_type :logo, :content_type => ['image/jpeg', 'image/png', 'image/gif']

  accepts_nested_attributes_for :organization_metrics

  scope :featured, where(Project.where("organization_id = organizations.id").exists).order("name")

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
