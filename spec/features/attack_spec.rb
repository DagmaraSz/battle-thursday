require "././app"
require "spec_helper"

RSpec.feature "attack management", :type => :feature do
  scenario "Player 1 attack Player 2 and gets confirmation" do
    sign_in_and_play
    click_link "Attack!"
    expect(page).to have_text("Dagmara attacks Royston!")
  end
end
