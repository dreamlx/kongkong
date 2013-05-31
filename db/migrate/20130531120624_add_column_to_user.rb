class AddColumnToUser < ActiveRecord::Migration
  def change
    add_column :users, :device_token, :string
    add_column :users, :username, :string
    add_column :users, :token_authenticatable, :string
  end
end
