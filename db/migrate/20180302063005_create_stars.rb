class CreateStars < ActiveRecord::Migration[5.1]
  def change
    create_table :stars do |t|
      t.integer :user_id
      t.integer :post_id

      t.timestamps
    end
  end
end
