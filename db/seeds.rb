# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'nokogiri'

file = File.open("julius_caesar.xml")
doc = Nokogiri::XML(file) do |config|
  config.noblanks
end
file.close

Play.create(title: doc.css("PLAY TITLE").children.first.text)
