ActiveAdmin.register Girl do
  sidebar "Details", :only => :show do
    ul do
      li link_to("Dailyposts", admin_girl_dailyposts_path(girl))
    end
  end

  index do
    column :id do |girl|
      li link_to girl.id, admin_girl_path(girl)
    end
    column :name
    column :bwh
    column :height
    column :updated_at
    actions
  end
end
