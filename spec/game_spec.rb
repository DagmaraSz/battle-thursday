require 'game'

describe Game do
  subject(:game) {described_class.new(player1, player2)}

  let(:player1) {double("Royston")}
  let(:player2) {double("Bob")}

  it "accepts 2 player instances when initialised" do
    expect(game.players[0]).to eq player1
    expect(game.players[1]).to eq player2
  end

  context "#set_current_player" do
    it 'sets the player whose turn it is' do
      game.set_current_player('p2')
      expect(game.players).to eq [player2, player1]
    end

    it 'only switches players when given player not current player' do
      game.set_current_player('p2')
      game.set_current_player('p2')
      expect(game.players).to eq [player2, player1]
    end
  end

  context "#attack" do
    it "has a defined damage" do
      expect(Game::DAMAGE).not_to be nil
    end
    it "can do attacks on another player" do
      allow(player1).to receive(:reduce_health)
      expect(player1).to receive(:reduce_health)
      game.attack(player1)
    end
  end

end
