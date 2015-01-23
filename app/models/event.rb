class Event < ActiveRecord::Base
  has_many :event_registrations
  has_many :sponsors, through: :sponsorships, source: :organization
  has_many :sponsorships
  has_many :users, through: :event_registrations
  has_many :featured_projects
  has_many :projects, through: :featured_projects

  attr_accessible :name, :short_code, :start_date, :end_date, :teaser, :description, :notes
  attr_accessible :logo, :logo_delete, :lead_organizer, :lead_email
  attr_accessible :organizer, :organizer_email, :location, :is_public
  attr_accessible :chat_url, :map_url, :schedule_url, :hashtag, :eventbrite_url
  attr_accessible :featured_projects_attributes
  attr_writer :logo_delete

  # Paperclip
  has_attached_file :logo, styles: { thumb: '100x100>', medium: '250x250>' },
                           url: '/system/images/logos/:class/:style/:id_:basename.:extension'
  validates_attachment_size :logo, less_than: 5.megabytes
  validates_attachment_content_type :logo, content_type: ['image/jpeg', 'image/png', 'image/gif']

  accepts_nested_attributes_for :featured_projects

  include FriendlyId
  friendly_id :name, use: :slugged

  scope :upcoming_events, where('end_date >= ?', Date.tomorrow)
  scope :public_events, -> { where(is_public: true) }

  def self.featured
    upcoming_events.public_events.order('start_date').first
  end

  def self.current
    Event.public_events.where("start_date <= ? AND end_date >= ?", Time.now, Time.now).first
  end

  def logo_delete
    @logo_delete || '0'
  end

  private

  def delete_logo
    logo.clear if logo_delete == '1'
  end
end
