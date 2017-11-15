class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email_id
      t.integer :game_count, :default=>0

      t.timestamps
    end
  end
end
