ActiveAdmin.register Girl do
  sidebar "Details", :only => :show do
    ul do
      li link_to("Dailyposts", admin_girl_dailyposts_path(girl))
    end
  end
end
