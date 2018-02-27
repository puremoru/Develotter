class Comment < ApplicationRecord
  belongs_to :post
  validates :content, {presence: true}

  def user
    User.find_by(id: self.user_id)
  end
end
