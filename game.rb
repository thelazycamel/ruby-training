class GuessingGame
  
  attr_accessor :number_of_guesses, :actual_number, :name, :guesses_allowed
  
  def start_game
    puts "Please enter your name"
    name = gets
    @name = name.chomp
    puts "Hi #{@name}, Welcome to the Guessing Game, please choose a number between 1 and 100"
    set_values
    ask_for_a_number
  end
  
  def set_values
    @guesses_allowed = 5
    @number_of_guesses = 0
    @actual_number = rand(100) + 1
  end
  
  def guess(number)
    case
      when number <= 0 || number > 100
        puts "Please choose a number between 1 and 100 only (or type quit)"
        ask_for_a_number
      when number > @actual_number
        puts "Too High, try again"
        count
        ask_for_a_number
      when number < @actual_number
        puts "Too Low, try again"
        count
        ask_for_a_number
      when number == @actual_number
        count
        completed_game("Congratulations #{@name}, it took you #{@number_of_guesses} guesses")
      end
  end
  
  def count
    @number_of_guesses += 1
    if @guesses_allowed - @number_of_guesses == 0
      completed_game("Game Over, sorry but you have run out of guesses")
    end
  end
    
  def ask_for_a_number
    puts "Take your guess, (you have #{@guesses_allowed - @number_of_guesses} left)"
    number = gets
    number = number.chomp
    if number.downcase == "quit"
      exit_game
    else
      guess(number.to_i)
    end
  end
  
  def completed_game(message)
    puts message
    play_again
  end
  
  def play_again
    puts "Would you like to play again (y/n)?"
    play_again = gets
    play_again = play_again.chomp
    if play_again.downcase.include?('y')
      start_game
    else
      exit_game
    end
  end
  
  def exit_game
    puts "Goodbye #{name} and thank you for playing"
  end
    
end

guess_it = GuessingGame.new
guess_it.start_game


