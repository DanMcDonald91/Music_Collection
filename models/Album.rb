require('pg')
require_relative('../db/SqlRunner')

class Album#

  attr_reader :title , :genre , :artist_id , :id


  def initialize (options)
    @id = options ["id"].to_i
    @title = options["title"]
    @genre = options["genre"]
    @artist_id = options["artist_id"].to_i
    
  end

  def save()

      db = PG.connect({ dbname: 'music_collection' , host: 'localhost'})
      sql = "INSERT INTO album (title, genre, artist_id) VALUES ('#{@title}', '#{@genre}', #{@artist_id}) returning *"
      @id = db.exec(sql).first["id"].to_i
      db.close
    end

def self.all
  db = PG.connect({dbname: 'music_collection' , host: 'localhost'})
    sql = "SELECT * FROM album;"
    album = db.exec(sql)
    db.close
   return album.map { |album| Album.new(album) }
  end

  def update()
    db = PG.connect({dbname: 'music_collection' , host: 'localhost'})
    sql = "UPDATE album SET (title, genre, artist_id) = '#{@genre}', #{@artist_id}) WHERE id = #{@id};"
  end




end

