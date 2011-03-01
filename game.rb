class GuessingGame
  
  attr_accessor :number_of_guesses, :actual_number, :name
  
  def start_game
    puts "Please enter your name"
    name = gets
    @name = name.chomp
    puts "Hi #{name} Welcome to the Guessing Game, please choose a number between 1 and 100"
    set_value
    ask_for_a_number
  end
  
  def set_value
    @number_of_guesses = 0
    @actual_number = rand(100) +1
  end
  
  def guess(number)
    case
      when number <= 0 || number > 100
        puts "Please choose a number between 1 and 100 only (or type quit)"
        ask_for_a_number
      when number > @actual_number
        @number_of_guesses += 1
        puts "Too High, try again"
        ask_for_a_number
      when number < @actual_number
        @number_of_guesses += 1
        puts "Too Low, try again"
        ask_for_a_number
      when @actual_number
        @number_of_guesses += 1
        completed_game
      end
  end
    
  def ask_for_a_number
    puts "Take your guess"
    number = gets
    number = number.chomp
    if number.downcase == "quit"
      exit_game
    else
      guess(number.to_i)
    end
  end
  
  def completed_game
    puts "Congratulations #{@name}, it took you #{@number_of_guesses} guesses"
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
    puts "Goodbye and thank you for playing"
  end
    
end

guess_it = GuessingGame.new
guess_it.start_game


