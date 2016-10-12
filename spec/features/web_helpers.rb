def sign_in_and_play
  visit "/"

  fill_in "Player 1", :with => "Dagmara"
  fill_in "Player 2", :with => "Royston"
  click_button "Fight!"
end
