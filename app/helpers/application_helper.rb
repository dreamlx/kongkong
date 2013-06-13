module ApplicationHelper
  def qiniu_image(post)
    if post.cost != 0
      image_tag post.photo.url+"?imageView/2/h/200/q/2" unless post.photo.blank?
    else
      image_tag post.photo.url+"?imageView/2/h/200" unless post.photo.blank?
    end
  end
end
