#encoding:utf-8
require 'spec_helper'

feature "Meals in menu template", %q{
  In order send menus to subscribers
  As an admin
  I want to manage meals in a menu template
} do

  let!(:template1) { create(:menu_template) }
  let!(:day1) { create(:day, menu_template: template1) }

  before do
    log_admin
    visit private_menu_template_path(template1)
  end

  scenario "I add a meal to a day" do
    click_link "Ajouter un repas"
    page.should have_content "Repas 1"
  end

  scenario "I remove a meal from a day" do
    meal = create(:meal, day: day1)
    visit private_menu_template_path(template1)
    within('.day-body') do
      click_link "supprimer"
    end
    within('#menu') do
      page.should have_no_content "Repas 1"
    end
  end

end

