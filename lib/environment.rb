require_relative "top_box_office/version.rb"
require_relative "top_box_office/cli.rb"
require_relative "top_box_office/scraper.rb"
require_relative "top_box_office/movie.rb"
require_relative "./environment.rb"

require 'nokogiri'
require 'pry'
require 'open-uri'
require 'colorize'

# add usefull classes to this file(below) some ex.'s would be CLI class, Box Office Class, 
#Movie class, etc.

module TopBoxOffice
  class Error < StandardError; end
  #Your code goes here...
end