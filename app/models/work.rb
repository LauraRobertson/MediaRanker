class Work < ApplicationRecord
  validates :category, presence: true
  validates :title, presence: true, uniqueness: true
  has_many :votes

  def self.popularity(category)
    top_ten = Work.where(category: category).sort_by{|work| -work.votes.count}
    return top_ten [0..9]
  end

  def self.spotlight
    return Work.all.sort_by{|work| -work.votes.count}.first
  end
end
