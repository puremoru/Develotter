class Comment < ApplicationRecord
  belongs_to :post

  def user
    User.find_by(id: self.user_id)
  end
end
