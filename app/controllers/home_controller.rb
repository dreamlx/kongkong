class HomeController < ApplicationController
  def index
    @dailyposts = []
    Girl.all.each do |girl|
      @dailyposts << girl.publish_posts.last unless girl.publish_posts.blank?
    end
  end
end
