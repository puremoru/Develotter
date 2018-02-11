class Post < ApplicationRecord
  validates :name, {presence: true}
  validates :about, {presence: true, length: {maximum: 200}}
end
