class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :name, {presence: true}
  validates :about, {presence: true, length: {maximum: 200}}
  # validates :user_id, {presence: true}

  def user
    return User.find_by(id: self.user_id)
  end
end
