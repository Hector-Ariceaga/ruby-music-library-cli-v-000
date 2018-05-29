require 'pry'
class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end
    
  def call 
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    
    input = nil
    
    while input != 'exit' do
      puts "What would you like to do?"
      input = gets.strip
    end
  end
  
  def list_songs
    Song.all.sort_by {|song| song.name}.each_with_index {|song, i| puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  
  def list_artists
    Artist.all.sort_by {|artist| artist.name}.each_with_index {|artist, i| puts "#{i+1}. #{artist.name}"}
    end 

  def list_genres
    Genre.all.sort_by {|g| g.name}.each_with_index {|g, i| puts "#{i+1}. #{g.name}"}
  end 
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    artist = Artist.find_or_create_by_name(input)
    artist.songs.sort_by {|s| s.name}.each_with_index {|s, i| puts "#{i+1}. #{s.name} - #{s.genre.name}"}
  end
end