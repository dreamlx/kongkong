class Girl < ActiveRecord::Base
  attr_accessible :birthday, :blood_type, :bwh, :description, :height, :hobby, :name, :nationality, :special_skill
  
  validates_presence_of :name
  validates_uniqueness_of :name
  
  has_many :photos, as: :resourceable, :dependent => :destroy
  has_many :videos, as: :resourceable, :dependent => :destroy
  has_many :sounds, as: :resourceable, :dependent => :destroy
end
