ActiveAdmin.register Share do
	index do
		column :id
		column :user_id
		column :dailypost_id
		column :photo_url
		default_actions
	end
end
