require('pg')
require_relative('../db/SqlRunner')

class Artist

  attr_reader :id,  :name

  def initialize (options)
    @id = options["id"].to_i if options ["id"]
    @name = options["name"]
  end

  def save()

      db = PG.connect({ dbname: 'music_collection' , host: 'localhost'})

      sql = "INSERT INTO artists (name) VALUES ('#{@name}') returning *"

      @id = db.exec(sql).first["id"].to_i
      db.close
 end

 def self.all 
    db = PG.connect({dbname: 'music_collection' , host: 'localhost'})
    sql = "SELECT * FROM artists;"
    artist = db.exec(sql)
    db.close
   return artist.map { |artist| Artist.new(artist) }
  end

end





