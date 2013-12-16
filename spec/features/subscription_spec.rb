#encoding: utf-8
require 'spec_helper'

feature "Subscription", %q{
  In order to receive a weekly menu
  As a visitor
  I want to suscribe
} do

  describe "when I subscribe from the homepage" do
    before do
      visit '/'
      fill_in 'subscriber_email', with: 'franck@example.com'
      click_button "Je m'abonne"
    end
    it "tells me that I should receive a validation email" do
      page.should have_content "Vous allez recevoir un email à l'adresse franck@example.com"
    end
    context "when I click on the link inside the validation email" do
      before do
        open_last_email
        current_email.to.should include "franck@example.com"
        click_first_link_in_email
      end
      it "brings me to a thanks page" do
        page.should have_content "Abonnement activé"
      end
    end
  end

  describe "#validation" do
    context "when the token is good"
    context "when the token is not good"
  end


end
