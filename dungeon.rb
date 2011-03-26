class Dungeon
  
  attr_accessor :player
  
  def initialize(player_name)
    @player = Player.new(player_name)
    @rooms = []
  end
  
  def add_room(reference, name, description, connections, foe="", item)
    @rooms << Room.new(reference, name, description, connections, foe, item)
  end
  
  def start(location)
    puts "Welcome to the Dungeon #{@player.name}" 
     @player.location = location
     show_current_description
  end
  
  def show_current_description
    puts "You are in the " + find_room_in_dungeon(@player.location).full_description
    puts "You are carrying: #{@player.item_list}"
    current_room = find_room_in_dungeon(@player.location)
      if current_room.foe 
        while current_room.foe.alive && @player.hp > 0 do
          puts "There is a #{current_room.foe.name} attacking you"
          puts current_room.foe.foe_status
          puts "You have #{@player.hp} hit points"
          puts "Press any key to fight"
          gets.chomp
          fight_foe(current_room.foe)        
        end
      end
    check_room_items(current_room) unless @player.dead
  end
  
  def check_room_items(current_room)
    if current_room.item.nil?
      return
    elsif
      current_room.item == :sword
      puts "You have found a sword, this will help your attack"
      @player.items << :sword
      current_room.item = nil
    elsif current_room.item == :potion
      puts "You have found some potion, you drink it and get 10 more points"
      @player.hp += 10
      puts "You now have #{@player.hp} hit points"
      current_room.item = nil
    elsif current_room.item == :holy_grail
      puts "You have found the lost secret, its the Holy Grail, congratulations, now get out of here"
      @player.items << :holy_grail
      current_room.item = nil
    end
  end
  
  def fight_foe(foe)
    player_score = roll_dice
    foe_score = roll_dice
    player_score += 3 if @player.items.include?(:sword)
    puts "The #{foe.name} rolled a #{foe_score} and you rolled a #{player_score}"
    @player.hp -= foe_score
    foe.hp -= player_score
    if @player.hp < 1
      puts "You have died"
      game_over
    end
    if foe.hp < 1
      foe.alive = false
      puts "The foe is dead"
      show_current_description
    end    
  end
  
  def find_room_in_dungeon(reference)
   @rooms.detect {|room| room.reference == reference}
  end
  
  def find_room_in_direction(direction)
     find_room_in_dungeon(@player.location).connections[direction]
  end
  
  def goodbye
    puts "Thank you for playing goodbye"
  end
  
  def game_over
    puts "Game over, sorry, you ran out of hit points"
  end
    
  def go(direction)
    puts "\nYou go try to go " + direction.to_s
    can_i_go = find_room_in_dungeon(@player.location).check_direction(direction)
    if can_i_go
      @player.location = find_room_in_direction(direction)
      puts "The door opened, you go through"
    else
      puts "You can't go that way"
    end
      show_current_description
        if @player.location.to_s == "exit" || @player.hp < 1
          goodbye
        else 
          get_direction
        end
  end
  
  def get_direction
     return if @player.dead
     puts "Which direction do you want to go #{@player.name}?"
     dir = gets.chomp
    case dir
      when "west"
        go(:west)
      when "east"
        go(:east)
      when "north"
        go(:north)
      when "south"
        go(:south)
      when "exit"
        goodbye
      else
        puts "Please use only 'north', 'south', 'east', 'west' or 'exit'\n"
        get_direction
    end
  end
  
  def roll_dice
    rand(6) + 1
  end
  
  class Player
    
    attr_accessor :name, :location, :hp, :items
    
    def initialize(name)
      @name = name
      @hp = 20
      @items = []
    end
    
    def item_list
      return "nothing" if @items.empty?
      items = @items.each {|item| item.to_s}.join(', ').gsub(/_/, ' ')
      return items
    end
    
    def dead
      return true if hp < 1
    end
    
  end
  
  class Room
    
    attr_accessor :reference, :name, :description, :connections, :foe, :item
  
    def initialize(reference,name,description,connections,foe=nil, item=nil)
      @reference = reference
      @name = name
      @description = description
      @connections = connections
      @foe = foe ? Foe.new(foe) : "" 
      @item = item
    end
  
     def full_description
       @name + "\nIt is " + @description + "\n\n"
     end
   
     def check_direction(direction)
       @connections.include?(direction)
     end
     
   end
   
  class Foe
    attr_accessor :name, :hp, :alive

    def initialize(foe)
      @name = foe
      @hp = rand(10)+2
      @alive = true if foe != ""
    end
    
    def foe_status
      if @alive
        puts "The #{@name} has #{hp} hit points"
      else
        puts "The #{@name} is dead"
      end
    end
      
  end
  
end

puts "Please enter your name..."
yourname = gets.chomp

my_dungeon = Dungeon.new(yourname)

my_dungeon.add_room(:largecave, 'Large Cave', 'a cavernous cave', {:west => :smallcave, :south => :beach}, "Orc", "")
my_dungeon.add_room(:smallcave, 'Small Cave', 'a small, claustrophobic cave', {:east => :largecave, :north => :tunnel, :west => :pool}, "")
my_dungeon.add_room(:tunnel, 'Tunnel', 'a small, dark tunnel', {:south => :smallcave, :north => :hall, :west => :stairs}, "Snake", "")
my_dungeon.add_room(:hall, 'Hall', 'the Hall of the Mountain King', {:south => :tunnel, :west => :deadend, :east => :exit}, "Harmless Bunny", "")
my_dungeon.add_room(:deadend, 'Dead End', 'a dead end with no other doors', {:east => :hall}, "Dragon", :holy_grail)
my_dungeon.add_room(:exit, 'The Exit', 'Freedom, Congratulations you have escaped from the Dungeon and found the village', {:east => :hall}, "", "")
my_dungeon.add_room(:pool, 'The Pool', 'a beautiful, deep blue pool', {:east => :smallcave, :north => :stairs}, "", :sword)
my_dungeon.add_room(:stairs, 'The Spiral Staircase', 'an old spiral staircase through the dungeon', {:east => :tunnel, :south => :pool}, "Large Spider", :potion)
my_dungeon.add_room(:beach, 'The Beach', 'hot and sandy, you need to find the village', {:north => :largecave}, "", "")

my_dungeon.start(:beach)

my_dungeon.get_direction
