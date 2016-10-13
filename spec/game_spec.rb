require 'game'

describe Game do
  subject(:game) {described_class.new(player1, player2)}

  let(:player1) {double("Royston")}
  let(:player2) {double("Bob")}

  context "#attack" do
    it "has a defined damage" do
      expect(Game::DAMAGE).not_to be nil
    end
    it "can do attacks on another player" do
      allow(player1).to receive(:reduce_health)
      expect(player1).to receive(:reduce_health)
      game.attack(player1)
    end
    it "accepts 2 player instances when initialised" do
      expect(game.players[0]).to eq player1
      expect(game.players[1]).to eq player2
    end

    it "can switch players" do
      game.switch
      expect(game.players).to eq [player2, player1]
    end

  end
end
