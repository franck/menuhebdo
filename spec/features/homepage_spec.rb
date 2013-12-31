require 'spec_helper'

feature "Homepage", %q{
  In order to get infos on Mon Menu Hebdo
  As a visitor
  I want to go to the homepage
} do

  scenario "Homepage shows a teaser" do
    visit '/'
    page.should have_content "Menu hebdo"
    page.should have_content "Recevez chaque dimanche un menu pour la semaine"
  end


end
