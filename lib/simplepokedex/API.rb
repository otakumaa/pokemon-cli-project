class API
    def self.get_names
       response = RestClient.get("https://pokeapi.co/api/v2/pokemon?limit=700")
       pokemon_array = JSON.parse(response.body)["results"]
       pokemon_array.each do |poke|
          Pokemon.new(poke["name"])
        end   
    end
    def self.get_details(pokemon)
       response = RestClient.get("https://pokeapi.co/api/v2/pokemon/#{pokemon}")
       poke = Pokemon.find_by_name(pokemon)[0]
       moves_array = JSON.parse(response.body)["moves"].map do |move|
          move["move"]["name"]
       end 
       abilities_array = JSON.parse(response.body)["abilities"].map do |ability|
          ability["ability"]["name"]
       end 
       poke.type = JSON.parse(response.body)["types"][0]["type"]["name"]
       poke.moves = moves_array.join("\n")
       poke.ability = abilities_array.join("\n") 
       poke
    end 
 end 