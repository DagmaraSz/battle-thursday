require "././app"
require "spec_helper"

RSpec.feature "player name management", :type => :feature do
  scenario "adding player names at start of game" do
    sign_in_and_play
    expect(page).to have_text("Dagmara Vs Royston")
  end
end
