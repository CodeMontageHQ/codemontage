class OrganizationsController < ApplicationController

  def index
    @organizations = Organization.all
    @featured_orgs = Organization.where("image_url IS NOT NULL")
  end
end
