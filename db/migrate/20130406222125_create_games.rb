class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.text :board,            {:default => Array.new(3) { Array.new(3) }}

      t.timestamps
    end
  end
end
