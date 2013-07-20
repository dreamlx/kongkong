class HomeController < ApplicationController
  def index
    @dailyposts = []
    Girl.all.each do |girl|
      @dailyposts << girl.publish_posts.last unless girl.publish_posts.blank?
    end

    respond_to do |format|
      format.html { render action: "index" }
      format.json { render json: @dailyposts }
    end
  end
end
