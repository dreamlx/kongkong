class Girl < ActiveRecord::Base
  attr_accessible :birthday, :blood_type, :bwh, :description, :height, :hobby, :name, :nationality, :special_skill
  attr_accessible :dailyposts_attributes
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :dailyposts, :dependent => :destroy
  
  accepts_nested_attributes_for :dailyposts, :allow_destroy => true

end
