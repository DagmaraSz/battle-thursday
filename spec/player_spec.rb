require 'player'

describe Player do
  subject(:player) {described_class.new}
  let(:game) {double("game")}

  context "#initialise" do
    it "can have a name" do
      player.set_name("Royston")
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

  context "lose" do
    it "returns dead when it dies" do
      expect(player.reduce_health(Player::TOTAL_HEALTH)).to eq "dead"
    end
  end

end
