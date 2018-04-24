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

   def save()
     db = PG.connect({
       dbname: "space_cowboys",
       host: "localhost"
       })
    sql = "INSERT INTO space_cowboys
       (name,
        species,
        last_known_location,
        homeworld)
        VALUES
        ($1, $2, $3, $4) RETURNING id"
    values = [@name, @species, @last_known_location, @homeworld]
    db.prepare("save", sql)
    @id = db.exec_prepared("save", values)[0]["id"].to_i
    db.close()
  end





end
