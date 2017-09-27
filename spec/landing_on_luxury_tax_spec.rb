require_relative '../src/game'
require_relative './support/fixed_movement_player'

describe 'Landing on luxury tax' do
  it 'landing on luxury tax decrease balance by $75' do
    tax = 75
    player = FixedMovementPlayer.new
    player.locate('Pacific Avenue')
    
    game = Game.new(player, player)

    expect{ game.next_turn }.to change{ player.balance }.by(-tax)
  end

  it 'passing over luxury tax does not change the balance' do
    player = FixedMovementPlayer.new
    player.locate('North Carolina Avenue')
    
    game = Game.new(player, player)

    expect{ game.next_turn }.not_to change{ player.balance }
  end
end