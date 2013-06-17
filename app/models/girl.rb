class Girl < ActiveRecord::Base
  attr_accessible :birthday, :blood_type, :bwh, :description, :height, :hobby, :name, :nationality, :special_skill
  attr_accessible :dailyposts_attributes
  validates_presence_of :name
  validates_uniqueness_of :name

  has_many :dailyposts
  has_many :publish_posts, class_name: "Dailypost", conditions: "state = 'published'"
  accepts_nested_attributes_for :dailyposts, :allow_destroy => true

  has_many :loser_likes, class_name: "LoserLike", :dependent => :destroy
  has_many :losers, through: :loser_likes
end
