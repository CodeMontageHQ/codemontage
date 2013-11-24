namespace :paperclip do
	desc "Save logos to organizations using existing urls"
	task :save_logos_from_urls => :environment do
		Organization.find_each do |org|
			unless org.image_url.blank?
				begin
					insecure_url = org.image_url.gsub(/\Ahttps:/, "http:")
					org.logo = URI.parse(insecure_url)
					org.image_url = ""
					org.save
				rescue StandardError => e
					puts "ID: #{org.id} - ORG: #{org.name} raised an exception. Save logo manually."
					puts "\t#{e.message}"
					puts "\timage_url: #{org.image_url}\n\n"
				end
			end
		end
	end
end
