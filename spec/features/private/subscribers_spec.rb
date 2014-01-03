#encoding:utf-8
require 'spec_helper'

feature "Manage subscribers", %q{
  In order avoid cluttering the subscribers database
  As an admin
  I want to manage my subscribers
} do

  before do
    log_admin
  end

  context "with subscribers" do
    let!(:sub1) { create(:subscriber) }
    before do
      visit private_subscribers_path
    end
    scenario "I can list all subscribers" do
      page.should have_content "Abonnés"
      page.should have_content sub1.email
    end
    scenario "I can delete a subscriber" do
      click_link "supprimer"
      page.should have_no_content sub1.email
    end
    scenario "I can edit a subscriber" do
      click_link "modifier"
      fill_in "subscriber_email", with: "nouveau@email.com"
      click_button "Modifier"
      page.should have_content "nouveau@email.com"
    end
    scenario "I can validate a subscriber" do
      click_link "valider"
      sub1.reload
      page.should have_content SubscriberPresenter.new(sub1).validated_at
      page.should have_content "Abonné validé"
    end
  end

end
