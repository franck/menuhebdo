#encoding:utf-8
require 'spec_helper'

feature "Manage Recipes", %q{
  In order complete recipe with description and ingredients
  As an admin
  I want to manage my recipes
} do

  before do
    log_admin
  end

  context "with a recipe" do
    let!(:recipe) { create(:recipe) }
    before do
      click_link "Recettes"
    end
    scenario "I can edit a recipe" do
      click_link 'modifier'
      fill_in 'recipe_name', with: "Nouveau nom de recette"
      click_button "Enregistrer"
      page.should have_content "Nouveau nom de recette"
    end
    scenario "I see a error message if something wrong on edit" do
      click_link 'modifier'
      fill_in 'recipe_name', with: ""
      click_button "Enregistrer"
      page.should have_content "Il manque le nom de la recette"
    end
    scenario "I can delete a recipe" do
      click_link "supprimer"
      page.should have_no_content recipe.name
    end
  end

  scenario "I can add a recipe" do
    click_link "Recettes"
    click_link "Ajouter une recette"
    fill_in "recipe_name", with: "Saumon"
    click_button "Enregistrer"
    page.should have_content "Saumon"
  end

end
