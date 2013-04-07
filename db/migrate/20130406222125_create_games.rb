class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.text :board
      t.string :player_o
      t.string :player_x
      t.string :current_player
      t.string :status
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
