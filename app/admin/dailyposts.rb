ActiveAdmin.register Dailypost do
  #belongs_to :girl
  filter :state, :as => :select, collection: [ "default", "published"]
  filter :cost
  filter :girl
  filter :content
  filter :created_at
  filter :updated_at
  member_action :toggle_publish, :method => :put do
  @dailypost = Dailypost.find(params[:id])

  @dailypost.published? ? @dailypost.cancel : @dailypost.push_home
    redirect_to admin_dailyposts_path(@dailypost), {:notice => "state was changed!"}
  end

  form do |f|
    f.inputs "Details" do
      f.input :girl_id, as: :select, collection: Girl.all
      f.input :cost, placeholder: "spend how many flower?"
      f.input :state, collection: [ "default", "published"]
    end

    f.inputs "content" do
      f.input :photo
      f.input :content
    end

    f.actions
  end

  index do
    column :id
    column "Photo" do |post|
      image_tag post.photo.url+"?imageView/2/h/200"
    end
    column :cost
    column "State" do |post|
      link_to post.state_name, toggle_publish_admin_dailypost_path(post), method: "PUT"
    end
    column :content
    column :created_at
    actions
  end

  show do |post|
    h3 post.girl.name
    attributes_table do
      row :id
      row :girl_id do
        post.girl.name
      end
      row :photo do 
        image_tag post.photo.url
      end
      row :content
      row :cost
      row :state
      row :created_at
    end
    active_admin_comments
  end

end
