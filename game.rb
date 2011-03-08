class GuessingGame
  
  def initialize(name=nil)
    name ? @name = name : @name = get_name 
    @minimum_number = get_min_number
    @maximum_number = get_max_number
    @guesses_allowed = 5
    @number_of_guesses = 0
    @actual_number = rand(@minimum_number - @maximum_number) + @minimum_number
  end
  
  def get_name
    puts "Hi there stranger, whats your name"
    gets.chomp
  end
  
  def get_min_number
    puts "Please choose a minimum number"
    gets.chomp.to_i
  end
  
  def get_max_number
    puts "Please choose a maximum number"
    max = gets.chomp.to_i
    while max <= @minimum_number do
      puts "The maximum number must be bigger than the minimum number"
      max = gets.chomp.to_i
    end
    max
  end
  
  def start_game
    puts "Hi #{@name}, Welcome to the Guessing Game, please choose a number between #{@minimum_number} and #{@maximum_number}"
    ask_for_a_number
  end
  
  def guess(number)
    return exit_game if number.downcase == "quit"
    number = number.to_i
    if number < @minimum_number || number > @maximum_number
      puts "Please choose a number between #{@minimum_number} and #{@maximum_number} only (or type quit)"
      ask_for_a_number
    elsif number > @actual_number
      puts "Too High, try again"
      @number_of_guesses += 1
      ask_for_a_number
    elsif number < @actual_number
      puts "Too Low, try again"
      @number_of_guesses += 1
      ask_for_a_number
    else #number must equal actual number
      @number_of_guesses += 1
      completed_game("Congratulations #{@name}, it took you #{@number_of_guesses} guesses")
    end  
  end
    
  def ask_for_a_number
    if @guesses_allowed - @number_of_guesses == 0
      completed_game("Game Over, sorry but you have run out of guesses the number was #{@actual_number}")
    else
      puts "Take your guess, (you have #{@guesses_allowed - @number_of_guesses} left)"
      guess(gets.chomp)
    end
  end
  
  def completed_game(message)
    puts message
    play_again
  end
  
  def play_again
    puts "Would you like to play again (y/n)?"
    if gets.chomp.downcase.include?('y')
      self.class.new(@name).start_game
    else
      exit_game
    end
  end
  
  def exit_game
    puts "Goodbye #{@name} and thank you for playing"
  end
    
end

GuessingGame.new.start_game