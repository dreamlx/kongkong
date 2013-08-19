object @dailypost

cache @dailypost, :expires_in => 12.hour

attributes 	:id, 
			:updated_at, 
			:girl_id, 
			:content, 
			:cost, 
			:linkto, 
			:favor_state, 
			:payment_state,
			:total_favor

node :photo_url do |d| 
  d.photo.url 
end

