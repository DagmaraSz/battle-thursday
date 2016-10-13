require "spec_helper"

RSpec.feature "attack management", :type => :feature do
  scenario "Player 1 attack Player 2 and gets confirmation" do
    sign_in_and_play
    click_button "P1 Attacks!"
    expect(page).to have_content("Dagmara attacks Royston!")
  end
  scenario "Reduce Player 2's hitpoints by 10" do
    sign_in_and_play
    click_button "P1 Attacks!"
    expect(page).to have_content("Royston's HP: 90/100")
  end
  scenario "Player 2 attack Player 1 and gets confirmation" do
    sign_in_and_play
    click_button "P2 Attacks!"
    expect(page).to have_content("Royston attacks Dagmara!")
  end
  scenario "Reduce Player 1's hitpoints by 10" do
    sign_in_and_play
    click_button "P2 Attacks!"
    expect(page).to have_content("Dagmara's HP: 90/100")
  end
end
