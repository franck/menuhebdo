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

  context "with a meal" do
    let!(:meal) { create(:meal, day: day1) }
    before do
      visit private_menu_template_path(template1)
    end
    scenario "I remove a meal from a day" do
      within('.day-body') do
        click_link "supprimer"
      end
      within('#menu') do
        page.should have_no_content "Repas 1"
      end
    end

    scenario "add recipe to meal", js: true do
      fill_in "recipe_name", with: "Saumon riz gluant"
      page.execute_script("$('input.recipe_name').trigger('DOMActivate').change().focusout();")
      sleep 0.1
      visit private_menu_template_path(template1)
      find_field('recipe_name').value.should eq "Saumon riz gluant"
    end

    context "with a recipe" do
      let!(:recipe) { create(:recipe) }
      before do
        meal.recipe = recipe
        meal.save
        visit private_menu_template_path(template1)
      end

      scenario "change recipe from meal", js: true do
        find_field('recipe_name').value.should eq recipe.name
        fill_in "recipe_name", with: "Tournedos rosini"
        page.execute_script("$('input.recipe_name').trigger('DOMActivate').change().focusout();")
        visit private_menu_template_path(template1)
        find_field('recipe_name').value.should eq "Tournedos rosini"
      end
    end
  end


end

