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

def update()
  db = PG.connect({
    dbname: "space_cowboys",
    host: "localhost"
    })
 sql = "UPDATE space_cowboys
    SET (name,
     species,
     last_known_location,
     homeworld) =
     ($1, $2, $3, $4)
     WHERE id = $5"
 values = [@name, @species, @last_known_location, @homeworld, @id]
 db.prepare("update", sql)
 db.exec_prepared("update", values)
 db.close()
end

def delete()
  db = PG.connect({
    dbname: "space_cowboys",
    host: "localhost"
    })
 sql = "DELETE FROM space_cowboys WHERE id = $1"
 db.prepare("delete", sql)
 db.exec_prepared("delete", [@id])
 db.close()
end


# Class method
def BountyClass.delete_all()
  db = PG.connect({
    dbname: "space_cowboys",
    host: "localhost"
    })
 sql = "DELETE FROM space_cowboys"
 db.prepare("delete_all", sql)
 db.exec_prepared("delete_all")
 db.close()
end

def BountyClass.find_by_name(name)
  db = PG.connect({
    dbname: "space_cowboys",
    host: "localhost"
    })
    sql = "SELECT * FROM space_cowboys WHERE name = $1"
    db.prepare("find_by_name", sql)
    name_hash = db.exec_prepared("find_by_name", [name])
    db.close()
    name_found = name_hash.map { |name| BountyClass.new(name)}
    return name_found.first()
  end

  def BountyClass.find_by_id(id)
    db = PG.connect({
      dbname: "space_cowboys",
      host: "localhost"
      })
      sql = "SELECT * FROM space_cowboys WHERE id = $1"
      db.prepare("find_by_name", sql)
      name_hash = db.exec_prepared("find_by_name", [id])
      db.close()
      name_found = name_hash.map { |name| BountyClass.new(name)}
      return name_found.first()
    end





end
