#encoding:utf-8
require 'spec_helper'

feature "Manage menu templayes", %q{
  In order send menus to subscribers
  As an admin
  I want to manage my menu templates
} do

  before do
    log_admin
    visit private_menu_templates_path
  end

  scenario "create a menu template" do
    click_link "Ajouter un modèle de menu"
    fill_in "menu_template_title", with: "Eté #1"
    click_button "Suivant"
    click_button "Enregistrer"
    page.should have_content "Eté #1"
  end

  context "with a menu template" do
    let!(:template1) { create(:menu_template) }
    before do
      visit private_menu_templates_path
    end
    scenario "edit it" do
      click_link "modifier"
      fill_in "menu_template_title", with: "Nouveau titre"
      click_button "Enregistrer"
      page.should have_content "Nouveau titre"
    end
    scenario "delete it" do
      click_link "supprimer"
      page.should have_no_content template1.title
      page.should have_content "Modèle supprimé"
    end
  end


end
