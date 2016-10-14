require 'game'

describe Game do

  subject(:game) {described_class.new(player1, player2)}
  let(:player1) {double("Royston", name: "Royston", reduce_health: true, sleeping: false, sleep: true, poison: true, poisoned: false, wake_up: true, paralyse: true, paralysed: false)}
  let(:player2) {double("Bob", name: "Dagmara", reduce_health: true, sleeping: false, sleep: true, poison: true, poisoned: false, wake_up: true, paralyse: true, paralysed: false)}

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
    it "damages the attacking player if they are poisoned" do
      expect(player1).to receive(:reduce_health)
      allow(player1).to receive(:poisoned).and_return(true)
      game.attack(player2, "standard")
    end
    it "skips the turn of attacking player if they are sleeping" do
      allow(player1).to receive(:sleeping).and_return(true)
      expect(player2).not_to receive(:reduce_health)
      game.attack(player2, "standard")
    end
    it "damges player 1 if they are poisoned and sleeping" do
      allow(player1).to receive(:sleeping).and_return(true)
      allow(player1).to receive(:poisoned).and_return(true)
      expect(player1).to receive(:reduce_health)
      game.attack(player2, "standard")
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
    it "can send other player to sleep" do
      expect(player1).to receive(:sleep)
      game.attack(player1, "sleep")
    end
    it "can paralyse the other player" do
      expect(player1).to receive(:paralyse)
      allow(game).to receive_messages(chance: true)
      game.attack(player1, "paralyse")
    end
    it "can put the other player to sleep by paralysing him" do
      expect(player1).to receive(:sleep)
      allow(game).to receive_messages(chance: true)
      game.attack(player1, "paralyse")
    end
    it "can damage the other player by paralyse attack" do
      expect(player1).to receive(:reduce_health)
      game.attack(player1, "paralyse")
    end
    it "player wakes up at the end of their attack if they are paralysed" do
      allow(player1).to receive(:paralysed).and_return(true)
      allow(player1).to receive(:sleeping).and_return(true)
      expect(player1).to receive(:wake_up)
      game.attack(player2, "standard")
    end
    it "can wake up" do
      allow(player1).to receive(:sleeping).and_return(true)
      allow(game).to receive_messages(chance: true)
      expect(player1).to receive(:wake_up)
      game.attack(player2, "standard")
    end
    it "doesn't damage the other player if it is waking up" do
      allow(player1).to receive(:sleeping).and_return(true)
      allow(game).to receive_messages(chance: true)
      expect(player2).not_to receive(:reduce_health)
      game.attack(player2, "standard")
    end
    it "doesn't put the other player to sleep if it is waking up" do
      allow(player1).to receive(:sleeping).and_return(true)
      allow(game).to receive_messages(chance: true)
      expect(player2).not_to receive(:sleep)
      game.attack(player2, "standard")
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
