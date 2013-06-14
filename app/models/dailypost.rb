class Dailypost < ActiveRecord::Base
  attr_accessible :content, :girl_id, :linkto, :photo, :cost, :state
  default_value_for :cost, 0

  mount_uploader :photo, AttachmentUploader
  mount_uploader :linkto, AttachmentUploader
  belongs_to :girl

  state_machine :state, initial: :default do
    state :default, :published

    event :push_home do
      transition :default => :published
    end

    event :cancel do
      transition :published => :default
    end
  end
end
