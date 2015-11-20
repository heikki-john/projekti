class CreateFavoriteNumbers < ActiveRecord::Migration
  def change
    create_table :favorite_numbers do |t|
      t.integer :user_id
      t.integer :num1
      t.integer :num2
      t.integer :num3
      t.integer :num4
      t.integer :num5
      t.integer :num6
      t.integer :num7

      t.timestamps null: false
    end
  end
end
