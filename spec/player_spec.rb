require 'player'

describe Player do
  subject(:player) {described_class.new("Royston")}
  subject(:player2) {described_class.new("Dagmara)")}

  context "#initialise" do
    it "has a name" do
      expect(player.name).to eq "Royston"
    end
    it "has HP" do
      expect(player.hp).to eq Player::TOTAL_HEALTH
    end
  end
  context "attack" do
    it "can take damage" do
      expect{player.reduce_health(10)}.to change{player.hp}.by(-10)
    end
  end

end
