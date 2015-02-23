module ApplicationHelper
  def sortable(column, type = nil, title = nil)
    title ||= column.titleize
    if column == params[:sort] && params[:direction] == "asc"
      direction = "desc"
    else
      direction = "asc"
    end
    # direction = column == params[:sort] && params[:direction] == "asc" ? "desc" : "asc"
    link_to title, sort: column, direction: direction, type: type
  end
end
