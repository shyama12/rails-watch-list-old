# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'open-uri'
require 'json'

puts 'Clearing the db'
Bookmark.destroy_all
Movie.destroy_all
List.destroy_all
puts 'Cleaned up'

serialized_content = URI.open('http://tmdb.lewagon.com/movie/top_rated?api_key=<your_api_key>').read
content_json = JSON.parse(serialized_content)

content_json["results"].each do |result|
  movie = Movie.new(
    title: result["original_title"],
    overview: result["overview"],
    poster_url: "https://image.tmdb.org/t/p/w500/#{result["poster_path"]}",
    rating: result["vote_average"]
  )

  movie.save!
  puts "created movie #{movie.poster_url}"
end
puts "#{Movie.count} movies created"
