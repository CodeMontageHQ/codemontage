class Event < ActiveRecord::Base
  before_save :delete_logo

  has_many :event_registrations
  has_many :sponsors, through: :sponsorships, source: :organization
  has_many :sponsorships
  has_many :users, through: :event_registrations
  has_many :featured_projects
  has_many :projects, through: :featured_projects

  attr_accessible :name, :short_code, :start_date, :end_date, :teaser, :description, :notes
  attr_accessible :logo, :logo_delete, :lead_organizer, :lead_email, :schedule
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

  scope :upcoming_events, -> { where("end_date >= ?", Time.now) }
  scope :public_events, -> { where(is_public: true) }

  def self.featured
    upcoming_events.public_events.order('start_date').first
  end

  def self.current
    public_events.
      where("start_date <= ? AND end_date >= ?", Time.now, Time.now).first
  end

  def logo_delete
    @logo_delete || '0'
  end

  def favorited_project_stats
    stats = {}
    stats[:by_project] = {}

    projects.each do |project|
      event_faves = project.favorite_projects.select do |fave|
        fave.created_at >= start_date && fave.created_at <= end_date
      end

      stats[:by_project].merge!(project.name => event_faves.count)
    end

    stats[:total] = stats[:by_project].values.reduce(:+)

    stats
  end

  def github_api_args
    { day_begin: start_date,
      day_end:   end_date }
  end

  def attendee_github_stats
    @attendee_github_stats ||= fetch_attendee_github_stats
  end

  def project_github_stats
    @project_github_stats ||= fetch_project_github_stats
  end

  def total_github_stats
    github_metrics = [:pull_requests, :commits, :issues, :forks]
    stats = {}

    github_metrics.each do |metric|
      stats[metric] = 0

      attendee_github_stats.each do |_user, user_stats|
        stats[metric] += user_stats[metric] if user_stats
      end
    end

    stats
  end

  def github_stats
    @github_stats ||= fetch_github_stats
  end

  def fetch_github_stats
    stats = {}

    stats[:featured_project_favorites] = favorited_project_stats
    stats[:by_attendee] = attendee_github_stats
    stats[:by_project] = project_github_stats
    stats[:total] = total_github_stats

    stats
  end

  private

  def delete_logo
    logo.clear if logo_delete == '1'
  end

  def fetch_attendee_github_stats
    stats = {}

    event_registrations.find_in_batches(batch_size: 5) do |er_batch|
      er_batch.each do |er|
        begin
          stats.merge!(er.user.email => er.fetch_github_stats)
        rescue
          next
        end
      end

      sleep(60) # avoid GH search rate limit of 20 requests per minute
    end

    stats
  end

  def fetch_project_github_stats
    stats = {}

    featured_projects.find_in_batches(batch_size: 5) do |fp_batch|
      fp_batch.each do |fp|
        begin
          stats.merge!(fp.project.name => fp.fetch_github_stats)
        rescue
          next
        end
      end

      sleep(60) # avoid GH search rate limit of 20 requests per minute
    end

    stats
  end
end
