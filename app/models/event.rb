class Event < ActiveRecord::Base
  has_many :check_ins
  has_many :sponsors, through: :sponsorships, source: :organization
  has_many :sponsorships
  has_many :users, through: :check_ins

  attr_accessible :name, :short_code, :start_date, :end_date, :teaser, :description, :notes
  attr_accessible :logo, :logo_delete, :lead_organizer, :lead_email, :organizer, :organizer_email, :location
  attr_accessible :chat_url, :map_url, :schedule_url, :hashtag, :eventbrite_url
  attr_writer :logo_delete

  # Paperclip
  has_attached_file :logo, styles: { thumb: '100x100>', medium: '250x250>' },
                           url: '/system/images/logos/:class/:style/:id_:basename.:extension'
  validates_attachment_size :logo, less_than: 5.megabytes
  validates_attachment_content_type :logo, content_type: ['image/jpeg', 'image/png', 'image/gif']

  include FriendlyId
  friendly_id :name, use: :slugged

  scope :upcoming_events, where('end_date >= ?', Date.tomorrow)

  def self.featured
    upcoming_events.order('start_date').first
  end

  def logo_delete
    @logo_delete || '0'
  end

  private

  def delete_logo
    logo.clear if logo_delete == '1'
  end
end
