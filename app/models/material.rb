class Material < ActiveRecord::Base
  attr_accessible :content, :price, :resourceable, :resourceable_id, :title
  belongs_to :resourceable, :polymorphic => true
end
