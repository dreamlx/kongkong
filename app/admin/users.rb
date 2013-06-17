ActiveAdmin.register User do
    sidebar "Credit", :only => :show do
    ul do
      li "Balance: " + user.credit.balance.to_s
    end
  end
    index do
    column :id
    column :email
    column :username
    column :last_sign_in_at
    column :sign_in_count
    column :created_at
    column :credit_balance do |user|
      user.credit.balance
    end
    actions
  end
end
