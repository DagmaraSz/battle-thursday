require 'player'

describe Player do
  subject(:player) {described_class.new("Royston")}
  subject(:player2) {described_class.new("Dagmara)")}

  context "#initialise" do
    it "has a name" do
      expect(player.name).to eq "Royston"
    end
    it "has HP" do
      expect(player.hp).to eq 100
    end
  end
  context "#attack" do
    it "attacks player for 10 damage" do
      player.attack(player2)
      expect(player2.hp).to eq 90
    end
  end
end
