require "spec_helper"

RSpec.feature "hit point management", :type => :feature do
  scenario "see Player 2's hitpoints" do
    sign_in_and_play
    expect(page).to have_text("Royston's HP: 100/100")
  end

  scenario "see Player 1's hitpoints" do
    sign_in_and_play
    expect(page).to have_text("Dagmara's HP: 100/100")
  end
  scenario "Player 1 reaches 0HP and looses" do
    sign_in_and_play
    10.times{click_button "P2 Attacks!"}
    expect(page).to have_text("Dagmara LOST!")
  end
  scenario "Player 2 reaches 0HP and looses" do
    sign_in_and_play
    10.times{click_button "P1 Attacks!"}
    expect(page).to have_text("Royston LOST!")
  end
end
