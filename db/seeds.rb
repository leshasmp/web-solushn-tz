# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
5.times do |_i|
  Artist.create!(
    name: Faker::Music::GratefulDead.player
  )
end

artists = Artist.all

artists.each do |artist|
  5.times do |_i|
    artist.songs.create!(
      title: Faker::Music::GratefulDead.song,
      length: rand(0..100),
      filesize: rand(0..100)
    )
  end
end

songs = Song.all

songs.each do |song|
  Download.create!(
    song_id: song.id,
    count: rand(0..100)
  )
end
