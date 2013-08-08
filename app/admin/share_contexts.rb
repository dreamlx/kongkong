ActiveAdmin.register ShareContext do
	index do
		column :apk_url
		column :context
		default_actions
	end

	form do |f|
		f.inputs "Admin Details" do       
			f.input :apk_url                  
			f.input :context
		end                               
		f.actions                         
	end
end