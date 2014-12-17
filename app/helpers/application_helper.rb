module ApplicationHelper
  def display_url(url)
    url.gsub(%r{^https?://}, '')
  end

  # Returns organization logo or image_url for organization logo,
  # for use in organization and project views, if it exists.
  def find_logo(organization, options = {})
    if organization.logo.present?
      organization.logo.url(options[:size] || :medium)
    elsif organization.image_url.present?
      organization.image_url
    end
  end

  # Returns true if organization logo or image_url for organization logo exist
  def find_logo?(organization)
    organization.logo.present? || organization.image_url.present?
  end

  def twitter_url(handle)
    "http://twitter.com/#{handle}" unless handle.blank?
  end
end
