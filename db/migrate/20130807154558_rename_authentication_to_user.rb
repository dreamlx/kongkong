class RenameAuthenticationToUser < ActiveRecord::Migration
  def change
  	rename_column :users, :authentication_token,:token_authenticatable
  end
end
