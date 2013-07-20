class GirlsController < InheritedResources::Base
  before_filter :authenticate_user!
  
  def index
  	@girl = Girl.find(params[:id])
  end

end
