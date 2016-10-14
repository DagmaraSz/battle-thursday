require "spec_helper"

RSpec.feature "attack management", :type => :feature do

before(:each) do
  sign_in_and_play
  @game = Game.game
  @player1 = @game.player1
  @player2 = @game.player2
end

  scenario "Player 1 attack Player 2 and gets confirmation" do
    click_button "P1 Attacks!"
    expect(page).to have_content("#{@player1.name} attacks #{@player2.name}!")
  end
  scenario "Reduce Player 2's hitpoints" do
    click_button "P1 Attacks!"
    expect(page).to have_content("#{@player2.name}'s HP: #{@player2.hp}/#{Player::TOTAL_HEALTH}")
  end
  scenario "Player 2 attack Player 1 and gets confirmation" do
    click_button "P2 Attacks!"
    expect(page).to have_content("#{@player2.name} attacks #{@player1.name}!")
  end
  scenario "Reduce Player 1's hitpoints" do
    click_button "P2 Attacks!"
    expect(page).to have_content("#{@player1.name}'s HP: #{@player1.hp}/#{Player::TOTAL_HEALTH}")
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
    expect(page).to have_content("#{@player1.name} paralyse #{@player2.name}!")
  end

  scenario "Player 2 paralyses Player 1 and gets confirmation" do
    click_button "P2 Paralyse"
    expect(page).to have_content("#{@player2.name} paralyse #{@player1.name}!")
  end

  scenario "Player 1 poisons Player 2 and gets confirmation", focus: true do
    click_button "P1 Poison"
    expect(page).to have_content("#{@player1.name} poisons #{@player2.name}!")
  end

  scenario "Player 2 poisons Player 1 and gets confirmation", focus: true  do
    click_button "P2 Poison"
    expect(page).to have_content("#{@player2.name} poisons #{@player1.name}!")
  end

  scenario "Player 1 sleeps Player 2 and gets confirmation" do
    click_button "P1 Sleep"
    expect(page).to have_content("#{@player1.name} sleeps #{@player2.name}!")
  end

  scenario "Player 2 sleeps Player 1 and gets confirmation" do
    click_button "P2 Sleep"
    expect(page).to have_content("#{@player2.name} sleeps #{@player1.name}!")
  end

  scenario "Player 1 sleeps Player 2 and gets confirmation" do
    click_button "P1 Sleep"
    expect(page).to have_content("#{@player1.name} puts #{@player2.name} to sleep!")
  end

  scenario "Player 2 sleeps Player 1 and gets confirmation" do
    click_button "P2 Sleep"
    expect(page).to have_content("#{@player2.name} puts #{@player1.name} to sleep!")
  end

  scenario "Player 1 heals and gets confirmation" do
    click_button "P1 Heal"
    expect(page).to have_content("#{@player1.name} heals!")
  end

  scenario "Player 2 heal and gets confirmation" do
    click_button "P2 Heal"
    expect(page).to have_content("#{@player2.name} heals!")
  end

end
