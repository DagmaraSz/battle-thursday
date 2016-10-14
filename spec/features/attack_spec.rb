require "spec_helper"

RSpec.feature "attack management", :type => :feature do

before(:each) do
  sign_in_and_play
  @game = Game.game
  @players = @game.players
  @player1 = @game.player1
  @player2 = @game.player2
end

  scenario "Player 1 attack Player 2 and gets confirmation" do
    click_button "P1 Attacks!"
    expect(page).to have_content("#{@players[0].name} attacks #{@players[1].name}!")
  end
  scenario "Reduce Player 2's hitpoints" do
    click_button "P1 Attacks!"
    expect(page).to have_content("#{@players[1].name}'s HP: #{@players[1].hp}/#{Player::TOTAL_HEALTH}")
  end
  scenario "Player 2 attack Player 1 and gets confirmation" do
    click_button "P2 Attacks!"
    expect(page).to have_content("#{@players[1].name} attacks #{@players[0].name}!")
  end
  scenario "Reduce Player 1's hitpoints" do
    click_button "P2 Attacks!"
    expect(page).to have_content("#{@players[0].name}'s HP: #{@players[0].hp}/#{Player::TOTAL_HEALTH}")
  end
  scenario "Lost message is dispalyed for Player1" do
    @game.lose(@player1)
    click_button 'P1 Attacks!'
    expect(page).to have_text("#{@player1.name} LOST!")
  end
  scenario "Lost message is displayed for Player2" do
    @game.lose(@player2)
    click_button 'P2 Attacks!'
    expect(page).to have_text("#{@player2.name} LOST!")
  end

  scenario "Player 1 paralyses Player 2 and gets confirmation" do
    click_button "P1 Paralyse"
    expect(page).to have_content("#{@players[0].name} paralyses #{@players[1].name}!")
  end

  scenario "Player 2 paralyses Player 1 and gets confirmation" do
    click_button "P2 Paralyse"
    expect(page).to have_content("#{@players[1].name} paralyses #{@players[0].name}!")
  end

  scenario "Player 1 poisons Player 2 and gets confirmation" do
    click_button "P1 Poison"
    expect(page).to have_content("#{@players[0].name} poisons #{@players[1].name}!")
  end

  scenario "Player 2 poisons Player 1 and gets confirmation"  do
    click_button "P2 Poison"
    expect(page).to have_content("#{@players[1].name} poisons #{@players[0].name}!")
  end

  scenario "Player 1 sleeps Player 2 and gets confirmation" do
    click_button "P1 Sleep"
    expect(page).to have_content("#{@players[0].name} puts #{@players[1].name} to sleep!")
  end

  scenario "Player 2 sleeps Player 1 and gets confirmation" do
    click_button "P2 Sleep"
    expect(page).to have_content("#{@players[1].name} puts #{@players[0].name} to sleep!")
  end

  scenario "Player 1 sleeps Player 2 and gets confirmation" do
    click_button "P1 Sleep"
    expect(page).to have_content("#{@players[0].name} puts #{@players[1].name} to sleep!")
  end

  scenario "Player 2 sleeps Player 1 and gets confirmation" do
    click_button "P2 Sleep"
    expect(page).to have_content("#{@players[1].name} puts #{@players[0].name} to sleep!")
  end

  scenario "Player 1 heals and gets confirmation" do
    click_button "P1 Heal"
    expect(page).to have_content("#{@players[0].name} is healed!")
  end

  scenario "Player 2 heal and gets confirmation" do
    click_button "P2 Heal"
    expect(page).to have_content("#{@players[1].name} is healed!")
  end

end
