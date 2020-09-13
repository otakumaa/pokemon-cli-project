class Simplepokedex::CLI
    def start 
      API.get_names
      puts "Welcome pokemon trainer!!"
      puts "To use your pokedex and view a pokemon enter: 'pokedex'."
      puts "To continue on your adventure enter 'exit'."
      menu
    end 
    def menu
      puts ""
      input = gets.strip.downcase
      if input == "pokedex"
        pokemon_list    
      elsif input == "exit"
             puts "Enjoy your adventure and try to catch 'em all!"
      else 
        puts "Invalid entry."
        menu
      end 
    end 
    def pokemon_list
      puts ""
      puts ""
      Pokemon.all.each_with_index do |pokemon, index|
        puts "#{index + 1}. #{pokemon.name}"
      end 
      pokemon_choice
    end
    def pokemon_choice
      puts ""
      puts "Which pokemon would you like to know about?"
      puts "Please enter the name of a pokemon."
      puts ""
      input = gets.strip.downcase
      if Pokemon.find_by_name(input).empty? == false 
        pokemon_selection(input)
      else 
        puts "Invalid entry."
        pokemon_choice 
      end 
    end 
    def pokemon_selection(input)
      poke = API.get_details(input)
      puts "Name: #{poke.name}"
      puts "Type: #{poke.type}"
      puts "Abilities: #{poke.ability}"
      puts "Moves: #{poke.moves}"
      final_choice
    end
  end
  def final_choice 
    puts ""
    puts "Enter 'pokemon' to view more Pokemon or enter 'exit' to continue on your adventure. "
    input = gets.strip.downcase 
    if input == "pokemon"
     pokemon_list 
       elsif input == "exit"
        puts "Enjoy your adventure and try to catch 'em all!"
      else 
        puts "Invalid entry."
        final_choice
  end 
end 