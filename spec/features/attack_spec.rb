require "spec_helper"

RSpec.feature "attack management", :type => :feature do
  scenario "Player 1 attack Player 2 and gets confirmation" do
    sign_in_and_play
    click_link "Attack!"
    expect(page).to have_content("Dagmara attacks Royston!")
  end
  scenario "Reduce Player 2's hitpoints by 10" do
    sign_in_and_play
    click_link "Attack!"
    expect(page).to have_content("Royston's HP : 90/100")
  end
end
