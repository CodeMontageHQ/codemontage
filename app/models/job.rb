class Job < ActiveRecord::Base
  belongs_to :organization
  acts_as_ordered_taggable
  acts_as_ordered_taggable_on :technologies, :causes
  
  attr_accessible :apply_url, :expires_at, :organization_id, :overview, :title, :location, :cause_list, :technology_list
  
  scope :active, where(['expires_at IS NULL OR expires_at > ?', DateTime.now])
  
end
