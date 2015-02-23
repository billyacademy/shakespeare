class RolesController < ApplicationController
  require 'will_paginate/array'
  def index
    @play = Play.find(params[:play_id])
    @roles = sorted_roles(params)
  end

  private
  def sort_column
    Role.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end

  def sort_direction
    ['asc', 'desc'].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def sorted_roles(params)
    if params[:type] == 'calculated'
      if sort_direction == 'asc'
        return Role.all.sort_by { |role| role.send(params[:sort].to_sym) }.paginate(per_page: 10, page: params[:page])
      else
        return Role.all.sort_by { |role| role.send(params[:sort].to_sym) }.reverse.paginate(per_page: 10, page: params[:page])
      end
    else
      Role.order(sort_column + ' ' + sort_direction).paginate(per_page: 10, page: params[:page])
    end
  end
end
