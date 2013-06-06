class Api::LosersController < ApplicationController
  respond_to :json
  def aboutme
    @loser = User.find(current_user.id)
  end
end
