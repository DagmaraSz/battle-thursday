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
    it "can heal" do
      expect{player.increase_health(10)}.to change{player.hp}.by((10 * 0.7).round)
    end
    it "can be poisoned" do
      player.poison
      expect(player.poisoned).to be true
    end
    it "can sleep" do
      player.sleep
      expect(player.sleeping).to be true
    end
    it "can be paralysed" do
      player.paralyse
      expect(player.paralysed).to be true
    end
    it "can wake_up" do
      player.wake_up
      expect(player.sleeping).to be false
    end
  end

  context "lose" do
    it "returns dead when it dies" do
      expect(player.reduce_health(Player::TOTAL_HEALTH)).to eq "dead"
    end
  end

end
