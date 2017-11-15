class CreateFrames < ActiveRecord::Migration[5.1]
  def change
    create_table :frames do |t|
      t.string :name
      t.string :frame_score
      t.references :game, foreign_key: true, null: false

      t.timestamps
    end
  end
end
