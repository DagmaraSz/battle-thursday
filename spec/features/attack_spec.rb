require "spec_helper"

RSpec.feature "attack management", :type => :feature do

  scenario "Player 1 attack Player 2 and gets confirmation" do
    sign_in_and_play
    click_button "P1 Attacks!"
    expect(page).to have_content("Dagmara attacks Royston!")
  end
  scenario "Reduce Player 2's hitpoints" do
    sign_in_and_play
    click_button "P1 Attacks!"
    expect(page).to have_content("Royston's HP:")
  end
  scenario "Player 2 attack Player 1 and gets confirmation" do
    sign_in_and_play
    click_button "P2 Attacks!"
    expect(page).to have_content("Royston attacks Dagmara!")
  end
  scenario "Reduce Player 1's hitpoints" do
    sign_in_and_play
    click_button "P2 Attacks!"
    expect(page).to have_content("Dagmara's HP:")
  end
  scenario "Lost message is dispalyed for Player1" do
    sign_in_and_play
    Game.game.lose(Game.game.player1)
    click_button 'P1 Attacks!'
    expect(page).to have_text("Dagmara LOST!")
  end
  scenario "Lost message is displayed for Player2" do
    sign_in_and_play
    Game.game.lose(Game.game.player2)
    click_button 'P2 Attacks!'
    expect(page).to have_text("Royston LOST!")
  end
end
