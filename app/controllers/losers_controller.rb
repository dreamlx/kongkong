class LosersController < ApplicationController
  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to losers_path }
      format.json { head :no_content }
    end
  end

  def toggle
    @girl = Girl.find(params[:id])
    Loser.find(current_user).favor_toggle(@girl)
    redirect_to girl_path(@girl)
  end
end
