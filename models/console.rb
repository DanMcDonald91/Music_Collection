require('pry-byebug')

require_relative("artists")
require_relative('album')


artist1 = Artist.new({ 'name' => 'Frightened Rabbit'})

artist2 = Artist.new({ 'name' => 'Kasabian'})

artist1.save
artist2.save


album1 = Album.new({'title' => 'Midnight Organ Fight' , 'genre' => 'IndieRock' , 'artist_id' => artist1.id}) 

album2 = Album.new({'title' => 'Empire' , 'genre' => 'AlternativeRock' , 'artist_id' => artist2.id})

album1.save
album2.save





binding.pry

nil