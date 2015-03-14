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

    # role_name_array = []
    # @doc.xpath('//SCENE').each do |scene|
    #   scene.children.xpath('SPEAKER').each do |speaker|
    #     if !role_name_array.include?(speaker.children.text) && speaker.children.text != "All"
    #       role_name_array << speaker.children.text
    #     end
    #   end
    #   role_name_array.each do |role|
    #     RolesScene.create(scene_id: new_scene.id, role_id: Role.find_by(name: role).id)
    #   end
    # end
    #





    acts = Act.parse_all(@doc.xpath('PLAY//ACT'), @play)
    roles = Role.parse_all(@doc.xpath('//PERSONA'), @play)
    scenes = Scene.parse_all(@doc.xpath('//SCENE'))
    #roles_scenes = RolesScene.parse_all()



  end
end
