module ApplicationHelper
	# Returns organization logo or image_url for organization logo,
	# for use in organization and project views, if it exists.
	def find_logo(organization, options = {})
		size = options[:size] || :medium

		if organization.logo.exists?
			organization.logo.url(size)
		elsif !organization.image_url.blank?
			organization.image_url
		end
	end

	# Returns true if organization logo or image_url for organization logo exist
	def find_logo?(organization)
		organization.logo.exists? || !organization.image_url.blank?
	end
end
