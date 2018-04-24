require("pry")
require_relative("models/space_cowboys")

BountyClass.delete_all()

cowboy1 = BountyClass.new({
  "name" => "Han",
  "species" => "Human",
  "last_known_location" => "AsteroidAB",
  "homeworld" => "Earth"
  })
cowboy1.save()
cowboy2 = BountyClass.new({
  "name" => "Chewbaca",
  "species" => "Wookie",
  "last_known_location" => "AsteroidAB",
  "homeworld" => "Wookie Land"
  })
cowboy2.save()

cowboyhan = BountyClass.find_by_name("Han")
cowboychew = BountyClass.find_by_id(28)

  binding.pry
  nil
