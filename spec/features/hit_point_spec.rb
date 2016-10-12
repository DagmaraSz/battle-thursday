require "spec_helper"

RSpec.feature "hit point management", :type => :feature do
  scenario "see Player 2's hitpoints" do
    sign_in_and_play
    expect(page).to have_text("Royston's HP : 100/100")
  end
end
