class HomeController < ApplicationController
  def index
    @dailyposts = Dailypost.published_items

    respond_to do |format|
      format.html { render action: "index" }
      format.json { render json: @dailyposts }
    end
  end
end
