require "././app"
require "spec_helper"

RSpec.feature "hit point management", :type => :feature do
  scenario "see Player 2's hitpoints" do
    visit "/"

    fill_in "Player 1", :with => "Dagmara"
    fill_in "Player 2", :with => "Royston"
    click_button "Fight!"

    expect(page).to have_text("Royston's HP : 100/100")
  end
end
