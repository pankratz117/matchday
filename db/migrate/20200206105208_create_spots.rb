class CreateSpots < ActiveRecord::Migration[6.0]
  def change
    create_table :spots do |t|
      t.references :user, null: false, foreign_key: true
      t.references :matchday, null: false, foreign_key: true
      t.boolean :team_red
      t.boolean :team_blue

      t.timestamps
    end
  end
end
