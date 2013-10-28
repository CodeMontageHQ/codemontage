# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  # Admin User can login & add most other data via ActiveAdmin
  @user = User.new(:email => "user@codemontage.com", :password => "passw0rd")
  @user.is_admin = true
  @user.save!

  # Example Organization, Project, and Job
  Organization.create(:name => "CodeMontage", :url => "http://codemontage.com", :github_org => "CodeMontage", :twitter => "CodeMontage", :image_url => "http://codemontage.com/assets/cm_header_logo.png")
  Project.create(:organization_id => 1, :name => "CodeMontage Platform", :github_repo => "codemontage", :cause_list => "Volunteerism, Economic Empowerment, Tech Inclusion", :technology_list => "Ruby, Rails, PostgreSQL")
  Job.create(:organization_id => 1, :title => "Superhero", :overview => "Save the world with CodeMontage.", :cause_list => "Volunteerism, Economic Empowerment, Tech Inclusion", :technology_list => "Ruby, Rails, PostgreSQL")
