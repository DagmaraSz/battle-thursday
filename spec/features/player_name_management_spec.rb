require '././app'
require 'spec_helper'

RSpec.feature "player name management", :type => :feature do
  scenario "adding player names at start of game" do
    visit "/"

    fill_in "Player 1", :with => "Dagmara"
    fill_in "Player 2", :with => "Royston"
    click_button "Fight!"

    expect(page).to have_text("Dagmara Vs Royston")
  end
end
