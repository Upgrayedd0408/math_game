

require './player'

class MathGame
  def initialize(player1, player2)
    @current_player = player1
    @opponent = player2
  end

  def start
    while @current_player.score > 0 && @opponent.score > 0
      puts "-------NEW TURN-------"
      puts "#{@current_player.name}: #{@current_player.score} points | #{@opponent.name}: #{@opponent.score} points"
      generate_question
    end

  end



  def generate_question
    num1 = rand(1..20)
    num2 = rand(1..20)
    puts "#{@current_player.name}: What is #{num1} + #{num2}?"
    answer = gets.chomp.to_i
    check_answer(num1, num2, answer)
    if @current_player.score > 0 && @opponent.score > 0
      swap_players
    else
      puts "Game Over! #{@current_player.name} wins!"
      puts "#{@opponent.name} has #{@opponent.score} points left."
      puts "#{@current_player.name} has #{@current_player.score} points left."
    end
  end

  def check_answer(num1, num2, answer)
    correct_answer = num1 + num2
    if answer == correct_answer
      puts "Correct!"
    else
      puts "Incorrect! The correct answer was #{correct_answer}."
      decrease_points
    end
  end

  def swap_players
    @current_player, @opponent = @opponent, @current_player
  end

  def decrease_points
    if @opponent.score > 0
      @opponent.score -= 1
    end
  end
end

mike = Player.new("Mike")
chane = Player.new("Chane")
game = MathGame.new(mike, chane)
game.start


