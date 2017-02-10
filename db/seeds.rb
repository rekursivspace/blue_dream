# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Creating Label's"
Label.create!([
	{uuid: SecureRandom.uuid, name: "The Bunker NY"},
	{uuid: SecureRandom.uuid, name: "Acid Waxa"}
])

puts "Creating Artist's"
Artist.create!([
	{uuid: SecureRandom.uuid, label_id: 1, name: "Leisure Muffin"},
	{uuid: SecureRandom.uuid, label_id: 1, name: "Clay Wilson"},
	{uuid: SecureRandom.uuid, label_id: 2, name: "Roy Of The Ravers"}
])

puts "Creating Album's"
Album.create!([
	{uuid: SecureRandom.uuid, artist_id: 1, catalog: "BK-001", name: "The Bunker New York 001"},
	{uuid: SecureRandom.uuid, artist_id: 2, catalog: "BK-002", name: "The Bunker New York 002"},
	{uuid: SecureRandom.uuid, artist_id: 3, catalog: "ACIWAX06", name: "2 Late 4 Love 12\""}
])

puts "Creating Track's"
Track.create!([
	{uuid: SecureRandom.uuid, album_id: 1, name: "In Wearable Hertz (featuring Elizabeth Warren on violin)"},
	{uuid: SecureRandom.uuid, album_id: 1, name: "Heldscalla"},
	{uuid: SecureRandom.uuid, album_id: 1, name: "Alys"},
	{uuid: SecureRandom.uuid, album_id: 2, name: "E4"},
	{uuid: SecureRandom.uuid, album_id: 2, name: "Oizumi"},
	{uuid: SecureRandom.uuid, album_id: 2, name: "Socorro"},
	{uuid: SecureRandom.uuid, album_id: 3, name: "2 Late 4 Love (Part One)"},
	{uuid: SecureRandom.uuid, album_id: 3, name: "Emotinium"},
	{uuid: SecureRandom.uuid, album_id: 3, name: "2 Late 4 Love (Part Two)"},
	{uuid: SecureRandom.uuid, album_id: 3, name: "Melchester Acid (Part Two)"}
])
