class Girl < ActiveRecord::Base
  attr_accessible :birthday, :blood_type, :bwh, :description, :height, :hobby, :name, :nationality, :special_skill
  attr_accessible :photos_attributes, :videos_attributes, :sounds_attributes
  validates_presence_of :name
  validates_uniqueness_of :name
  
  has_many :photos, class_name: 'Material', as: :resource
  has_many :videos, class_name: 'Material', as: :resource
  has_many :sounds, class_name: 'Material', as: :resource

  accepts_nested_attributes_for :photos, :videos, :sounds, :allow_destroy => true
end
