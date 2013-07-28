object @dailypost
attributes :id, :updated_at, :girl_id, :content, :cost, :linkto, :favor_state

node :photo_url do |d| 
  d.photo.url 
end

