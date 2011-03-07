class RandomNumberGenerator
  
  def initialize(how_many=nil)
    @numbers = []
    @how_many = how_many || get_how_many
    @min_number = get_min_number
    @max_number = get_max_number
  end
  
  def get_how_many
    puts "How Many Random Numbers would you like"
    gets.chomp.to_i
  end
  
  def get_min_number
    puts "Please give me the lowest number"
    gets.chomp.to_i
  end
  
  def get_max_number
    max_number = 0
    while max_number <= @min_number do
      puts "Please give me a high number, it must be greater than #{@min_number}"
      max_number = gets.chomp.to_i
    end
    @max_number = max_number
  end
  
  def generate_numbers
    @how_many.times do |randomize|
      @numbers[randomize] = rand(@max_number - @min_number) + @min_number
    end
    show_numbers
  end
  
  def show_numbers
    puts "I have generated #{@how_many} random numbers between #{@min_number} and #{@max_number}, they are as follows"
    @numbers.each {|number| puts number}
    if @how_many == 6 && @min_number == 1 && @max_number == 49
      puts "You might wanna put these numbers on the national lottery ;)"
    end
    puts "Would you like to choose some more random numbers"
    if gets.chomp.downcase.include?('y')
      self.class.new.generate_numbers
    else
      exit_game
    end
  end
  
  def exit_game
    puts "Good bye, thanks for playing"
  end
  
end

RandomNumberGenerator.new(6).generate_numbers
