class User < ActiveRecord::Base
  class << self
    def current_user=(user)
      Thread.current[:current_user] = user
    end

    def current_user
      Thread.current[:current_user]
    end
  end
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  after_create { |user| user.create_credit(:start_balance => 0,:balance => 0) }
  devise  :database_authenticatable, 
          :registerable, 
          :token_authenticatable,
          :recoverable, 
          :rememberable, 
          :trackable, 
          :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, 
                  :password, 
                  :password_confirmation, 
                  :remember_me, 
                  :username, 
                  :device_token, 
                  :token_authenticatable
  attr_accessor   :login
  attr_accessible :login
  # attr_accessible :title, :body

  has_one :credit
  has_many :visit_histories
  has_many :shares
  has_many :see_shares

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value OR device_token = :value", { :value => login.downcase }]).first
    else
      where(conditions).first
    end
  end

  protected
  def create_it_credit
    self.create_credit
  end
end
