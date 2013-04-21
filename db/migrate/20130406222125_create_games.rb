class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.text :board,            {:default => Array.new(3).map{[]}}
      t.string :player_o      
      t.string :player_x       
      t.string :current_player
      t.string :status,         {:default => 'in_progress'}

      t.timestamps
    end
  end
end
