#begin
#  require 'wowr'
#rescue LoadError
#  require 'rubygems'
#  require 'wowr'
#£end

require 'lib/wowr.rb'
require 'yaml'

api = Wowr::API.new(:character_name => 'Hesperus',
                    :guild_name => 'Rawr',
                    :realm => 'Trollbane',
                    :locale => 'eu', # defaults to US
                    :lang => 'fr_fr', # remove for locale default language
                    :caching => false) # defaults to true

# For all requests it's possible to specify the parameters similar to the
# api constructor. By default it'll use whatever is specified in the API.

# gets character with API default values
default_char = api.get_character

# specify other character
jim = api.get_character("Jim", :realm => "Balnazzar", :lang => 'de_de', :caching => false)

# Character requests
chars = api.search_characters(:search => 'Cake')

# Guild requests
guilds = api.search_guilds("Cake")

# error handling
begin
  no_guild = api.get_guild("moo", :realm => 'bar')
rescue Wowr::Exceptions::GuildNotFound => e
  puts "Guild not found!"
end

jim.items.each do |item|
  puts item.icon
end

# Items
items = api.search_items("Cake")
item = api.get_item(33924)
item.created_by.each do |recipe|
  recipe.reagents.each do |reagent|
    puts reagent
  end
end

# Arena Teams
arena_teams = api.search_arena_teams("Lemon")
arena_team = api.get_arena_team("Lemon", 2, :realm => "Darksorrow")

# Guild Bank
#cookie = api.login('myuser', 'mypass')
#api.get_guild_bank_contents(cookie)
#api.get_guild_bank_log(cookie)

# Dungeon Data
dungeons = api.get_dungeons()
puts dungeons.to_yaml
dungeons.each do |dungeon|
  puts dungeon
end

