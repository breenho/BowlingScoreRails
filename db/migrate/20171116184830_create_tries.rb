class CreateTries < ActiveRecord::Migration[5.1]
  def change
    create_table :tries do |t|
      t.integer :try_1, :default=>0
      t.integer :try_2, :default=>0
      t.references :frame, foreign_key: true, null: false
      
      t.timestamps
    end
  end
end
