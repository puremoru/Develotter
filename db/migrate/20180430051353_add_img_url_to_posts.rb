class AddImgUrlToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :img_url, :text
  end
end
