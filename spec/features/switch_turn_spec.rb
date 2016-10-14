require "spec_helper"

RSpec.feature "switch turns", :type => :feature do

  scenario "Player 2 attacks player 1" do
    sign_in_and_play
    click_button "P2 Attacks!"
    expect(page).to have_content("Royston attacks Dagmara")
  end
end
