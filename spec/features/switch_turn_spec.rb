require "spec_helper"

RSpec.feature "switch turns", :type => :feature do
  scenario "Player 1 switches to Player 2" do
    sign_in_and_play
    click_button "Switch"
    expect(page).to have_content("Dagmara's HP: 100/100")
  end
  scenario "Attack now means player 2 attacks player 1" do
    sign_in_and_play
    click_button "Switch"
    click_link "Attack!"
    expect(page).to have_content("Royston attacks Dagmara")
  end
  scenario "Attack now reduces Player 1's hp" do
    sign_in_and_play
    click_button "Switch"
    click_link "Attack!"
    expect(page).to have_content("Dagmara's HP: 90/100")
  end

end
