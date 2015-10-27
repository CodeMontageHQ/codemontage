require "spec_helper"

describe "The basic content site", #:js => true,
         type: :feature do
  context "pages" do
    it "displays landing page" do
      visit "/"
      page.should have_content("Ready to change the world?")
    end

    it "displays projects page" do
      visit "/projects"
      page.should have_content("Projects")
    end

    it "displays jobs page" do
      visit "/jobs"
      page.should have_content("Jobs You've Been Looking For")
    end

    it "displays coder day page" do
      visit "/coder_day"
      page.should have_content("Coder Day of Service")
    end

    it "displays our story page" do
      visit "/our_story"
      page.should have_content("Major Contributors")
    end

    it "displays resources page" do
      visit "/resources"
      page.should have_content("We're not the only ones")
    end
  end
end
