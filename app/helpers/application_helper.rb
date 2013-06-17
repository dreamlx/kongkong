module ApplicationHelper
  def qiniu_image(post)
    if post.cost == 0 or (user_signed_in? and post.visited?(current_user.id || 0))
      image_tag post.photo.url+"?imageView/1/h/200/w/300" unless post.photo.blank?
    else
      image_tag post.photo.url+"?imageView/1/h/200/w/300/q/1" unless post.photo.blank?
    end
  end
end
