#!/usr/bin/env ruby

require 'rubygems'
require 'bundler'
Bundler.setup
require 'dotenv'
Dotenv.load
require 'twitter'
require 'pry'
require 'marky_markov'

rest = Twitter::REST::Client.new do |config|
  config.consumer_key         = ENV.fetch('CONSUMER_KEY')
  config.consumer_secret      = ENV.fetch('CONSUMER_SECRET')
  config.access_token         = ENV.fetch('ACCESS_TOKEN')
  config.access_token_secret  = ENV.fetch('ACCESS_TOKEN_SECRET')
end

rest.search("snark", result_type: "recent", lang: "en").take(1).each do |tweet|
	puts tweet.created_at
	puts tweet.text
	# puts tweet.time_zone
	# puts tweet.text
	# puts tweet.text
	binding.pry
end

# File.open("tweets.txt", "w+") do |f|
# 	rest.search("snark since:2015-04-01", result_type: "recent", lang: "en").take(10000).each do |tweet|
# 		f << tweet.text + "\r\n"
# 	end
# end

# markov = MarkyMarkov::Dictionary.new('dictionary')
# if File.exists? "tweets.txt"
# 	markov.parse_file "tweets.txt"
# else
# end
#
# 			markov.parse_string tweet.text
# 	markov.save_dictionary! # Saves the modified dictionary/creates one if it didn't exist.
# puts markov.generate_n_sentences 5

# rest.filter(:track => "snark") do |object|
#   puts object.text if object.is_a?(Twitter::Tweet)
# end

# stream = Twitter::Streaming::Client.new do |config|
#   config.consumer_key         = ENV.fetch('CONSUMER_KEY')
#   config.consumer_secret      = ENV.fetch('CONSUMER_SECRET')
#   config.access_token         = ENV.fetch('ACCESS_TOKEN')
#   config.access_token_secret  = ENV.fetch('ACCESS_TOKEN_SECRET')
# end


# TweetStream.configure do |config|
#   config.consumer_key        = ENV.fetch('CONSUMER_KEY')
#   config.consumer_secret     = ENV.fetch('CONSUMER_SECRET')
#   config.oauth_token         = ENV.fetch('ACCESS_TOKEN')
#   config.oauth_token_secret  = ENV.fetch('ACCESS_TOKEN_SECRET')
#   config.auth_method         = :oauth
# end
#
#
# stream.on_limit do |skip_count|
# 	puts "limit #{skip_count}"
#   sleep 1
# end
#
# stream.on_enhance_your_calm do
# 	puts "enchance_your_calm"
#   sleep 1
# end
#
# stream.track('snark') do |status|
#   puts "#{status.text}"
# end
