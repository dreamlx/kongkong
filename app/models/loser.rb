class Loser < User
  has_many :loser_likes, class_name: "LoserLike", :dependent => :destroy
  has_many :girls, through: :loser_likes

  def favor_toggle(girl)
    if girls.find(:all, :conditions => ["girls.id = ?", girl.id]).blank?
      girls << girl
    else
      girls.delete(girl)
    end
  end

  def favor_state(girl)
    !girls.find(:all, :conditions => ["girls.id = ?", girl.id]).blank?
  end
end