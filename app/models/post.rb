class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :stars
  validates :name, {presence: true}
  validates :about, {presence: true}
  # validates :user_id, {presence: true}

  if Rails.env.production?
      S3_CREDENTIALS={access_key_id: "AKIAJCCIRGFNA5BQKNAQ", secret_access_key: "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", bucket:"develotter", s3_host_name: "s3-ap-northeast-1.amazonaws.com"}#東京の場合
  end

  if Rails.env.production?
    has_attached_file :avatar, storage: :s3, s3_credentials: S3_CREDENTIALS,
    styles: { medium: "300x300!", thumb: "100x100!>"}, path:":attachment/:id/:style.:extension"
  else
    has_attached_file :avatar, styles: { medium: "300x300!", thumb: "100x100!>"}
  end

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
