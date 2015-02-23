class RolesController < ApplicationController
  def index
    @play = Play.find(params[:play_id])
    #@roles = Role.order(params[:sort])
    @roles = sorted_roles(params)
  end




  private
  def sort_column
    Role.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def sorted_roles(params)
    if params[:type] == 'calculated'
      if sort_direction == 'asc'
        return Role.all.sort_by { |role| role.send(params[:sort].to_sym) }
      else
        return Role.all.sort_by { |role| role.send(params[:sort].to_sym) }.reverse
      end
    else
      Role.order(sort_column + ' ' + sort_direction)
    end
  end
end

#
# def sorted_foos(params)
#   @foo = Model.includes(:bar).where(bar: { user_id: current_user.id })
#   if params[:type] == ‘calculated’
#     if sort_direction == ‘asc’
#       @foo.sort_by { |a| a.send(params[:sort]) }
#     else
#       @foo.sort_by { |a| a.send(params[:sort]) }.reverse
#     end
#   else
#     @foo.order(sort_column + ” ” + sort_direction)
#   end
