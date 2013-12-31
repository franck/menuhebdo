#encoding:utf-8
require 'spec_helper'

feature "Private Homepage", %q{
  In order to manage my business
  As an admin
  I want to go to the admin homepage
} do

  context "when not authenticated" do
    scenario "I cant access the admin pages" do
      visit '/private'
      page.should have_content "Vous devez vous connecter pour continuer"
    end
  end

  scenario "I can access the admin pages" do
    log_admin
    visit '/private'
    page.should have_content "Menu hebdo"
    page.should have_content "Abonnés"
  end

end
