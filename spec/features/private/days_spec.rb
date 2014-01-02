#encoding:utf-8
require 'spec_helper'

feature "Days in menu template", %q{
  In order send menus to subscribers
  As an admin
  I want to manage days in a menu template
} do

  let!(:template1) { create(:menu_template) }

  before do
    log_admin
    visit private_menu_templates_path
    click_link template1.title
  end

  context "with no day" do
    scenario "I can a day" do
      click_link "Ajouter un jour"
      page.should have_content "Jour 1"
    end
  end

  context "with a day" do
    let!(:day1) { create(:day, menu_template: template1) }
    before do
      visit private_menu_template_path(template1)
    end
    scenario "I can add another day" do
      click_link "Ajouter un jour"
      page.should have_content "Jour 2"
    end
    scenario "I can remove a day" do
      click_link "supprimer"
      within("#main") do
        page.should have_no_content "Jour 1"
      end
    end
  end



end
