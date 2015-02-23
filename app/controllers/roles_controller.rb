class RolesController < ApplicationController
  def index
    @play = Play.find(params[:play_id])
    @roles = Role.all
  end
end
