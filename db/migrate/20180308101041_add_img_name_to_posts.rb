class AddImgNameToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :img_name, :string
  end
end
