class CreateMatchdays < ActiveRecord::Migration[6.0]
  def change
    create_table :matchdays do |t|
      t.references :user, null: false, foreign_key: true
      t.string :sport_type
      t.date :date
      t.integer :red_score
      t.integer :blue_score
      t.string :mode
      t.references :sports_ground, null: false, foreign_key: true

      t.timestamps
    end
  end
end
