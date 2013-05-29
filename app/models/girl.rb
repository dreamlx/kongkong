class Girl < ActiveRecord::Base
  attr_accessible :birthday, :blood_type, :bwh, :description, :height, :hobby, :name, :nationality, :special_skill
  has_many :photos, as: :resourceable
  has_many :videos, as: :resourceable
  has_many :sounds, as: :resourceable
end
