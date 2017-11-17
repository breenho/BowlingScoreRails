class CreateFrames < ActiveRecord::Migration[5.1]
  def change
    create_table :frames do |t|
      t.string :name
      # t.string :frame_score, :default=>0
      
      t.timestamps
    end
  end
end
