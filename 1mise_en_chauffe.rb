
require 'dotenv'
Dotenv.load

require "pry"

#puts ENV['TWITTER_API_SECRET']

require 'twitter'
# quelques lignes qui enregistrent les clés d'APIs
#"streaming" est la fonctionnalité de l'API
client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = ENV["TWITTER_API_KEY"]
  config.consumer_secret     = ENV["TWITTER_API_SECRET"]
  config.access_token        = ENV["bitch1"]
  config.access_token_secret = ENV["bitch2"]
end
p client

topics = ["coffee", "tea"]
client.filter(track: topics.join(",")) do |object|
  puts "tweet"
  puts object.text if object.is_a?(Twitter::Tweet)
  puts " "
end

# ligne qui permet de tweeter
binding.pry
#client.update("Bonjour monde !")
