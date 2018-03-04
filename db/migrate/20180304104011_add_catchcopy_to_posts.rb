class AddCatchcopyToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :catchcopy, :string
  end
end
