class CreateGames < ActiveRecord::Migration[5.1]
  def change
    create_table :games do |t|
      t.string :name
      t.string :overal_score
      t.references :user, foreign_key: true, null: false

      t.timestamps
    end
  end
end
