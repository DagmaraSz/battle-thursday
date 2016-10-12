require 'player'

describe Player do
  subject(:player) {described_class.new("Royston")}

  it "has a name" do
    expect(player.name).to eq "Royston"
  end
  it "has HP" do
    expect(player.hp).to eq 100
  end

end
