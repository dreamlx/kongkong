class Dailypost < ActiveRecord::Base
  attr_accessible :content, :girl_id, :linkto, :photo, :cost

  mount_uploader :photo, AttachmentUploader
  mount_uploader :linkto, AttachmentUploader
  belongs_to :girl
end
