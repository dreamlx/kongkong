object @dailypost
attributes :id, :updated_at, :girl_id, :content, :cost

node :photo_url do |d| 
  d.photo.url 
end

node :linkto_url do |d| 
  d.linkto_url
end
