class CreateTries < ActiveRecord::Migration[5.1]
  def change
    create_table :tries do |t|
      t.string :name
      t.string :score
      t.references :frame, foreign_key: true, null: false

      t.timestamps
    end
  end
end