class Material < ActiveRecord::Base
  attr_accessible :content, :price, :resourceable, :resourceable_id, :title, :attachment
  belongs_to :resourceable, :polymorphic => true
  mount_uploader :attachment, AttachmentUploader
end
