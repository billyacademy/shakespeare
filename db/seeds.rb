# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# require 'nokogiri'
#
#
#   file = File.open("julius_caesar.xml")
#   doc = Nokogiri::XML(file) do |config|
#     config.noblanks
#   end
#   file.close
#
#   #create play
#   Play.create(title: doc.css("PLAY TITLE").children.first.text)
#
#   # # create acts
#   doc.xpath('PLAY//ACT').each  do |act|
#     Act.create(title: act.xpath('TITLE').text, play_id: Play.find_by(title: doc.xpath('//PLAY//TITLE').first.text).id)
#   end
#
#   #
#   # create scenes
#   doc.xpath('//SCENE').each do |scene|
#     Scene.create(title: scene.xpath('TITLE').text.gsub("\n", '').strip, act_id: Act.find_by(title: scene.parent.xpath('TITLE').text).id)
#   end
#
#   # create roles
#   doc.xpath('//PERSONA').each do |persona|
#     Role.create(name: persona.text, play_id: Play.find_by(title: persona.xpath("/PLAY/TITLE").children.first.text).id)
#   end
#
#   # # create speeches
#   doc.xpath('//SPEECH').each do |speech|
#     if speech.xpath('SPEAKER').first.text != "All"
#       if Role.find_by(name: speech.xpath('SPEAKER').first.text) == nil
#         Role.create(name: speech.xpath('SPEAKER').first.text, play_id: Play.find_by(title: speech.xpath("/PLAY/TITLE").children.first.text).id)
#         new_speech = Speech.create(role_id: Role.find_by(name: speech.xpath('SPEAKER').first.text).id, scene_id: Scene.find_by(title: speech.parent.xpath("TITLE").text.gsub("\n", '').strip).id)
#         speech.xpath('LINE').each do |line|
#           Line.create(message: line.children.text.gsub("\n", '').strip, speech_id: new_speech.id)
#         end
#       else
#       new_speech = Speech.create(role_id: Role.find_by(name: speech.xpath('SPEAKER').first.text).id, scene_id: Scene.find_by(title: speech.parent.xpath("TITLE").text.gsub("\n", '').strip).id)
#         speech.xpath('LINE').each do |line|
#           Line.create(message: line.children.text.gsub("\n", '').strip, speech_id: new_speech.id)
#         end
#       end
#     end
#   end
