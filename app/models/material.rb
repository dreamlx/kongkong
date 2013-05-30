class Material < ActiveRecord::Base
  attr_accessible :content, :price, :resource_type, :resource_id, :title, :attachment
  belongs_to :resource, polymorphic: true
  mount_uploader :attachment, AttachmentUploader
end
