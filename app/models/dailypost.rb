class Dailypost < ActiveRecord::Base
  attr_accessible :content, :girl_id, :linkto, :photo, :cost, :state
  validates_presence_of :girl_id, :photo
  validates_numericality_of :cost
  default_value_for :cost, 0
  scope :published_items, lambda { where("state = 'published'") }

  mount_uploader :photo, AttachmentUploader

  belongs_to :girl
  has_many :visit_histories

  has_many :loser_likes, class_name: "LoserLike", :dependent => :destroy
  has_many :losers, through: :loser_likes

  state_machine :state, initial: :default do
    state :default, :published

    event :push_home do
      transition :default => :published
    end

    event :cancel do
      transition :published => :default
    end
  end

  attr_accessor :favor_state, :payment_state, :total_favor
  def favor_state
    Loser.find(User.current_user).favor_state(self)
  end

  def payment_state
    v = VisitHistory.where("user_id = #{User.current_user.id} and dailypost_id = #{self.id}").first
    if v
      v.state
    else
      "unpaid"
    end
  end

  def total_favor
    self.visit_histories.count
  end
  def visited?(user_id = 0)
    self.visit_histories.where("user_id = #{user_id}").count > 0 ? true : false
  end

  def self.my_girls(loser_id)
    self.joins(:loser_likes).where("loser_id = #{loser_id}")
  end

end
