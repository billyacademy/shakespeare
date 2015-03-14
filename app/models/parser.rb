class Parser
  def self.parse_xml(xml)
    @file = File.open(xml)
    @doc = Nokogiri::XML(@file) do |config|
      config.noblanks
    end
    @file.close

    @play_title = Play.parse(@doc)
    Play.create(title: @play_title)

    @play = Play.find_by(title: @play_title)


    acts = Act.parse_all(@doc.xpath('PLAY//ACT'), @play)
    roles = Role.parse_all(@doc.xpath('//PERSONA'), @play)
    scenes = Scene.parse_all(@doc.xpath('//SCENE'))


    @doc.xpath('//SPEECH').each do |speech|
      role = Role.find_by(name: speech.xpath('SPEAKER').first.text)
      # role_from_speech(speech)
      if speech.xpath('SPEAKER').first.text != "All"
        if role == nil
          Role.create(name: speech.xpath('SPEAKER').first.text, play_id: @play.id)
        end
      end
    end

#SCENES && SCENEROLE##
    @doc.xpath('//SCENE').each do |scene|
      role_name_array = []
      new_scene = Scene.find_by(title: scene.xpath('TITLE').text.gsub("\n", '').strip,
      act_id: Act.find_by(title: scene.parent.xpath('TITLE').text).id)
      scene.children.xpath('SPEAKER').each do |speaker|
        if !role_name_array.include?(speaker.children.text) && speaker.children.text != "All"
          role_name_array << speaker.children.text
        end
      end
      role_name_array.each do |role|
        RolesScene.create(scene_id: new_scene.id, role_id: Role.find_by(name: role).id)
      end
    end

    ##SPEECHES & MISSING ROLES##
    @doc.xpath('//SPEECH').each do |speech|
      role = Role.find_by(name: speech.xpath('SPEAKER').first.text)
      if speech.xpath('SPEAKER').first.text != "All"
        new_speech = Speech.create(
                       role_id: role.id,
                                   scene_id: Scene.find_by(
        title: speech.parent.xpath("TITLE").text.gsub("\n", '').strip).id)
        speech.xpath('LINE').each do |line|
          Line.create(message: line.children.text.gsub("\n", '').strip,
          speech_id: new_speech.id)
        end
      end
    end





    #roles_scenes = RolesScene.parse_all()



  end
end
