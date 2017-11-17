class CreateTries < ActiveRecord::Migration[5.1]
  def change
    create_table :tries do |t|
      t.integer :try_name
      t.integer :score, :default=>0
      t.references :frame, foreign_key: true, null: false
      
      t.timestamps
    end
  end
end
