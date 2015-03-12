class ImportXML
  def self.import_play(xml_file)
    file = File.open(xml_file)
    doc = Nokogiri::XML(file) do |config|
      config.noblanks
    end
    file.close

    play_title = doc.css("PLAY TITLE").children.first.text

    ##PLAY TITLE##
    def create_play(title)
      Play.create(title: title)
    end

    create_play(play_title)

    current_play_id = Play.find_by(title: play_title).id
    
    ##ACTS##
    doc.xpath('PLAY//ACT').each  do |act|
      Act.create(title: act.xpath('TITLE').text, play_id: current_play_id)
    end
    ##ROLES##
    doc.xpath('//PERSONA').each do |persona|
      Role.create(name: persona.text, play_id: current_play_id)
    end

    doc.xpath('//SPEECH').each do |speech|
      role = Role.find_by(name: speech.xpath('SPEAKER').first.text)
      if speech.xpath('SPEAKER').first.text != "All"
        if role == nil
          role = Role.create(name: speech.xpath('SPEAKER').first.text, play_id:
          current_play_id)
        end
      end
    end

    ##SCENES && SCENEROLE##
    doc.xpath('//SCENE').each do |scene|
      role_name_array = []
      new_scene = Scene.create(title: scene.xpath('TITLE').text.gsub("\n", '').strip,
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
    doc.xpath('//SPEECH').each do |speech|
      role = Role.find_by(name: speech.xpath('SPEAKER').first.text)
      if speech.xpath('SPEAKER').first.text != "All"
        new_speech = Speech.create(role_id: role.id, scene_id: Scene.find_by(
        title: speech.parent.xpath("TITLE").text.gsub("\n", '').strip).id)
        speech.xpath('LINE').each do |line|
          Line.create(message: line.children.text.gsub("\n", '').strip,
          speech_id: new_speech.id)
        end
      end
    end
  end
end
