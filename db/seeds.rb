# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  # Admin User can login & add most other data via ActiveAdmin
  @user = User.new(email: "user@codemontage.com", :password: "passw0rd")
  @user.is_admin = true
  @user.save!

  # Exmaples
  # Organizations
  Organization.create(
    name: "CodeMontage", 
    url: "http://codemontage.com", 
    github_org: "CodeMontage", 
    twitter: "CodeMontage", 
    image_url: "http://codemontage.com/assets/cm_header_logo.png"
  )
  
  Organization.create(
    name: "OmahaCodeSchool", 
    url: "http://omahacodeschool.com", 
    github_org: "OmahaCodeSchool", 
    twitter: "OmahaCodeSchool", 
    image_url: "http://codemontage.com/assets/cm_header_logo.png"
  )
  
  Organization.create(
    name: "Dev Bootcamp", 
    url: "http://devbootcamp.com", 
    github_org: "DevBootCamp", 
    twitter: "DevBootCamp", 
    image_url: "http://codemontage.com/assets/cm_header_logo.png"
  )
  
  # Projects
  Project.create(
    organization_id: 1, 
    name: "CodeMontage Platform", 
    github_repo: "codemontage", 
    cause_list: "Volunteerism, Economic Empowerment, Tech Inclusion", 
    technology_list: "Ruby, Rails, PostgreSQL", 
    is_approved: true
  )
  
  Project.create(
    organization_id: 2, 
    name: "OmahaCodeSchool Platform", 
    github_repo: "omahacodeschool", 
    cause_list: "Tech Education, Social Empowerment, Tech Inclusion", 
    technology_list: "Ruby, Rails, PostgreSQL, Javascript, HTML, CSS", 
    is_approved: true
  )
  
  Project.create(
    organization_id: 3, 
    name: "DevBootCamp Platform", 
    github_repo: "devbootcamp", 
    cause_list: "Tech Education, Social Empowerment", 
    technology_list: "Ruby, Rails, Javascript, HTML, CSS", 
    is_approved: true
  )
  
  Project.create(
    organization_id: 1, 
    name: "Not Approved Project", 
    github_repo: "codemonate", 
    cause_list: "Volunteerism, Social Empowerment, Tech Inclusion", 
    technology_list: "Ruby, Rails, Javascript, HTML, CSS"
  )
  
  Project.create(
    organization_id: 2, 
    name: "Ruby Rogues Podcast",
    github_repo: "codemontage", 
    cause_list: "Tech Education, Social Empowerment, Talking Heads, Tech Awareness", 
    technology_list: "Ruby, Rails, Django, MongoDB, Python", 
    is_approved: true
  )
  
  # Jobs
  Job.create(
    organization_id: 1, 
    title: "Superhero", 
    overview: "Save the world with CodeMontage.", 
    cause_list: "Volunteerism, Economic Empowerment, Tech Inclusion", 
    technology_list: "Ruby, Rails, PostgreSQL"
  )
  
  Job.create(
    organization_id: 1, 
    title: "Happiness Engineer", 
    overview: "Save the world with CodeMontage by bringing joy to users.", 
    cause_list: "Volunteerism, Mood Empowerment, Tech Inclusion", 
    technology_list: "Ruby, Rails, PostgreSQL"
  )
