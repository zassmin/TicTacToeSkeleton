class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.text :board,            {:default => Array.new(3).map{[]}}
      t.string :player_o,       {:default => 'o'}
      t.string :player_x,       {:default => 'x'}
      t.string :current_player
      t.string :status,         {:default => 'in_progress'}

      t.timestamps
    end
  end
end
