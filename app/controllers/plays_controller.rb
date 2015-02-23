class PlaysController < ApplicationController
  def index
    @plays = Play.all
  end

  def show
  end
end
