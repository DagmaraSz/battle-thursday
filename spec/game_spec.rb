require 'game'

describe Game do

  subject(:game) {described_class.new(player1, player2)}
  let(:player1) {double("Royston")}
  let(:player2) {double("Bob")}

  it "can create an instance of itself" do
    expect(Game.create(player1, player2)).to be_an_instance_of(Game)
  end

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
    before do
      allow(player1).to receive(:reduce_health)
      allow(player2).to receive(:reduce_health)
      allow(player1).to receive(:poison)
      allow(player1).to receive(:poisoned).and_return(false)

    end
    it "damages the attacking player if they are poisoned", focus: true do
      expect(player1).to receive(:reduce_health)
      allow(player1).to receive(:poisoned).and_return(true)
      game.attack(player2, "standard")

    end
    it "has a defined damage" do
      expect(Game::DAMAGE).not_to be nil
    end
    it "can do standard attacks on another player" do
      expect(player1).to receive(:reduce_health)
      game.attack(player1, "standard")
    end
    it "can heal" do
      expect(player1).to receive(:increase_health)
      game.attack(player1, "heal")
    end
    it "can poison attack another player" do
      expect(player1).to receive(:poison)
      allow(game).to receive_messages(chance: true)
      game.attack(player1, "poison")
    end
  end

  context "#lose" do
    before(:each) do
      allow(player1).to receive(:poisoned).and_return(false)
    end
    it "sets the loser" do
      allow(player1).to receive(:reduce_health).and_return("dead")
      100.times{game.attack(player1,"standard")}
      expect(game.loser).to eq player1
    end
    it "confirms loosing" do
      allow(player1).to receive(:reduce_health).and_return("dead")
      100.times{game.attack(player1,"standard")}
      expect(game.was_lost).to eq true
    end
  end
end
