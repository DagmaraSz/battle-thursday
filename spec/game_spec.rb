require 'game'

describe Game do
  subject(:game) {described_class.new}

  let(:player) {double("Royston")}

  context "#attack" do
    it "has a defined damage" do
      expect(Game::DAMAGE).not_to be nil
    end
    it "can do attacks on another player" do
      allow(player).to receive(:reduce_health)
      expect(player).to receive(:reduce_health)
      game.attack(player)
    end
  end
end
