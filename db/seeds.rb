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

# #create play
# Play.create(title: doc.css("PLAY TITLE").children.first.text)

# # create acts
# doc.xpath('PLAY//ACT').each  do |act|
#   Act.create(title: act.xpath('TITLE').text, play_id: Play.find_by(title: doc.xpath('//PLAY//TITLE').first.text).id)
# end


# # create scenes
# doc.xpath('//SCENE').each do |scene|
#   Scene.create(title: scene.xpath('TITLE').text.gsub("\n", '').strip, act_id: Act.find_by(title: scene.parent.xpath('TITLE').text).id)
# end

# create roles
doc.xpath('//PERSONA').each do |persona|
  Role.create(name: persona.text, play_id: Play.find_by(title: persona.xpath("/PLAY/TITLE").children.first.text).id)
end
