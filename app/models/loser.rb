class Loser < User
  has_many :loser_likes, class_name: "LoserLike", :dependent => :destroy
  has_many :dailyposts, through: :loser_likes

  def favor_toggle(dailypost)
    if dailyposts.find(:all, :conditions => ["dailyposts.id = ?", dailypost.id]).blank?
      dailyposts << dailypost
    else
      dailyposts.delete(dailypost)
    end
  end

  def favor_state(dailypost)
    !dailyposts.find(:all, :conditions => ["dailyposts.id = ?", dailypost.id]).blank?
  end
end