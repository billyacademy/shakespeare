module ApplicationHelper
  def sortable(column, type = nil, title = nil)
    title ||= column.titleize
    if column == params[:sort] && params[:direction] == "asc"
      direction = "desc"
    else
      direction = "asc"
    end
    link_to title, sort: column, direction: direction, type: type
  end

  def create_line(data, role_info, scene_info)
    if role_info != nil
      speech = Speech.create(role_id: role_info.id, scene_id: scene_info.id)
      data.xpath('LINE').each do |line|
        Line.create(message: line.children.text.gsub("\n", '').strip, speech_id: speech.id)
      end
    end
  end
end
