class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :stars
  validates :name, {presence: true}
  validates :about, {presence: true}
  # validates :user_id, {presence: true}

  def user
    return User.find_by(id: self.user_id)
  end

  def comments
    return Comment.where(post_id: self.id)
  end

  def likes
    return Like.where(post_id: self.id)
  end

  def stars
    return Star.where(post_id: self.id)
  end
end
