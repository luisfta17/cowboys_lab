require("pg")

class BountyClass

   attr_accessor :name, :species, :last_known_location, :homeworld

   def initialize(options)
     @id = options["id"].to_i if options["id"]
     @name = options["name"]
     @species = options["species"]
     @last_known_location = options["last_known_location"]
     @homeworld = options["homeworld"]
   end

 



end
