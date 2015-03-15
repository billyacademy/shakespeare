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
    unlisted_roles = Role.parse_unlisted(@doc.xpath('//SPEECH'), @play)
    roles_scenes = RolesScene.parse_all(@doc.xpath('//SCENE/SPEECH/SPEAKER'))
    lines_from_speeches = Speech.parse_all(@doc.xpath('//SPEECH'))
  end
end
