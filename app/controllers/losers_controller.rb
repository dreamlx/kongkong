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

  def payment
    user = User.find(params[:id])
    balance = user.credit.balance
    balance = balance - params[:cost].to_i
    user.credit.update_attributes(:balance => balance)
    redirect_to dailypost_path(params[:post_id])
  end

end
