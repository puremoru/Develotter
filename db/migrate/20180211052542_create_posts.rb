class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :url
      t.string :theme
      t.string :about
      t.string :strength

      t.timestamps
    end
  end
end
