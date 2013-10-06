require "open-uri"

namespace :paperclip do
	desc "Save logos to organizations using existing urls"
	task :save_logos_from_urls => :environment do

		Organization.find_each do |org|
			unless org.image_url.blank?
				org.image_url.gsub!(/\Ahttps:/, "http:")
				org.logo = open(org.image_url)
				org.image_url = ""
				org.save
			end
		end
	end
end
