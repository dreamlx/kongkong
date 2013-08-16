class Api::TokensController  < ApplicationController
  skip_before_filter :verify_authenticity_token
  after_filter :first_login_add_credits
  respond_to :json
  def create
    email = params[:email]
    password = params[:password]
    if request.format != :json
      render :status=>406, :json=>{:message=>"The request must be json"}
      return
    end

    if email.nil? or password.nil?
     render :status=>400,
     :json=>{:message=>"The request must contain the user email and password."}
     return
   end

   @user=User.find_by_email(email.downcase)

   if @user.nil?
    logger.info("User #{email} failed signin, user cannot be found.")
    render :status=>401, :json=>{:message=>"Invalid email or passoword."}
    return
  end

    # http://rdoc.info/github/plataformatec/devise/master/Devise/Models/TokenAuthenticatable
    @user.ensure_authentication_token!

    if not @user.valid_password?(password)
      logger.info("User #{email} failed signin, password \"#{password}\" is invalid")
      render :status=>401, :json=>{:message=>"Invalid email or password."}
    else
      render :status=>200, :json=>{:token=>@user.authentication_token, :user => @user.to_json}
      
    end
  end

  def destroy
    @user=User.find_by_authentication_token(params[:id])
    if @user.nil?
      logger.info("Token not found.")
      render :status=>404, :json=>{:message=>"Invalid token."}
    else
      @user.reset_authentication_token!
      render :status=>200, :json=>{:token=>params[:id]}
    end
  end

  def first_login_add_credits
     email = params[:email]
     @user=User.find_by_email(email.downcase)
     @credit = Credit.find_by_user_id(@user.id)
     if @user.last_sign_in_at.nil?
        @credit.balance += 5
     elsif is_after(@user.current_sign_in_at,@user.last_sign_in_at) 
       @credit.balance += 5
     end
       @credit.save
  end
end

