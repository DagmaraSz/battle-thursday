require "spec_helper"

RSpec.feature "switch turns", :type => :feature do

  scenario "Player 2 attacks player 1" do
    sign_in_and_play
    click_button "P2 Attacks!"
    expect(page).to have_content("Royston attacks Dagmara")
  end

  scenario "Attack now reduces Player 1's hp" do
    sign_in_and_play
    click_button "P2 Attacks!"
    #visit "/play"
    expect(page).to have_content("Dagmara's HP: 90/100")
  end


end
