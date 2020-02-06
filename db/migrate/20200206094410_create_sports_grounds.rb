class CreateSportsGrounds < ActiveRecord::Migration[6.0]
  def change
    create_table :sports_grounds do |t|
      t.string :name
      t.string :address
      t.float :lat
      t.float :long
      t.string :photo_1
      t.string :photo_2
      t.string :photo_3

      t.timestamps
    end
  end
end
